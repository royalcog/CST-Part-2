var _round = (round_index >= 0 && round_index < array_length(rounds)) ? rounds[round_index] : noone;

switch (state)
{
    // wait for obj_UI to finish sliding into position, then hold a beat before starting
    case "waiting_ui_settle":
        if (instance_exists(obj_UI) && abs(obj_UI.x - obj_UI.target_x) < 1)
        {
            timer--;
            if (timer <= 0)
            {
                state = "advance_round";
            }
        }
    break;

    case "advance_round":
        if (array_length(rounds) == 0) break; // nothing configured yet — idle

        round_index = (round_index + 1) mod array_length(rounds);
        _round = rounds[round_index];

        // reset every box back to its normal look for the new round
        with (obj_battle_ui_box)
        {
            selected_attack = false;
        }

        select_index = 0;
        if (array_length(members) > 0 && members[select_index] != noone)
        {
            obj_UI.active_box = members[select_index];
        }
        timer = select_hold_frames;
        state = "select_active";
    break;

    // Susie's box turns from normal -> attack, then Ralsei's, then Queen's — one at a time.
    // The highlighted pose shows while that box is still active, so it's actually visible.
        case "select_active":
        timer--;
        if (timer <= 0)
        {
            if (select_index < array_length(members) && members[select_index] != noone)
            {
                members[select_index].selected_attack = true;
                audio_play_sound(snd_select, 1, false);

                // hold Susie/Ralsei in their "ready" stance until their attack turn actually comes up
                if (_round != noone && select_index < array_length(_round.attackers))
                {
                    var _picked = _round.attackers[select_index];
                    if (variable_struct_exists(_picked, "attacker") && variable_struct_exists(_picked, "ready_sprite") && instance_exists(_picked.attacker))
                    {
                        // ready_hold: true means hold still on frame 0 of the sprite instead of looping it
                        // (e.g. Queen's ready pose is just the first frame of her attack anim)
                        var _hold = variable_struct_exists(_picked, "ready_hold") && _picked.ready_hold;
                        with (_picked.attacker)
                        {
                            sprite_index = _picked.ready_sprite;
                            image_index = 0;
                            image_speed = _hold ? 0 : 1;
                            anim_loop = true;
                        }
                    }
                }
            }
            timer = select_confirm_frames;
            state = "select_confirm";
        }
    break;

    case "select_confirm":
        timer--;
        if (timer <= 0)
        {
            select_index++;

            if (select_index < array_length(members))
            {
                if (members[select_index] != noone) obj_UI.active_box = members[select_index];
                timer = select_hold_frames;
                state = "select_active";
            }
            else
            {
                obj_UI.active_box = noone; // everyone's chosen — no box stays raised
                attack_index = 0;
                state = "attacking_start";
            }
        }
    break;

    // attack animations play one at a time, each dealing its own damage to King
    case "attacking_start":
        if (attack_index >= array_length(_round.attackers))
        {
            state = (_round != noone && variable_struct_exists(_round, "is_final") && _round.is_final)
                ? "final_dialogue_start" : "talk_start";
            break;
        }

        var _atk = _round.attackers[attack_index];
        attack_sound_played = false;

        var _has_anim = variable_struct_exists(_atk, "attacker") && variable_struct_exists(_atk, "attack_sprite")
            && instance_exists(_atk.attacker);

        if (_has_anim)
        {
            with (_atk.attacker)
            {
                sprite_index = _atk.attack_sprite;
                image_index = 0;
                image_speed = 1;
                anim_loop = false;
            }

            // no delay frame set — play right as the swing starts, same as before
            var _sound_frame = variable_struct_exists(_atk, "attack_sound_frame") ? _atk.attack_sound_frame : 0;
            if (_sound_frame <= 0 && variable_struct_exists(_atk, "attack_sound"))
            {
                audio_play_sound(_atk.attack_sound, 1, false);
                attack_sound_played = true;
            }

            state = "attacking_anim_wait";
        }
        else
        {
            if (variable_struct_exists(_atk, "attack_sound"))
            {
                audio_play_sound(_atk.attack_sound, 1, false);
            }
            state = "attacking_hit";
        }
    break;

    case "attacking_anim_wait":
        var _atk = _round.attackers[attack_index];

        // fire the swing sound once the animation reaches its configured frame (default: frame 0, already handled above)
        if (!attack_sound_played && variable_struct_exists(_atk, "attack_sound") && instance_exists(_atk.attacker))
        {
            var _sound_frame = variable_struct_exists(_atk, "attack_sound_frame") ? _atk.attack_sound_frame : 0;
            if (_atk.attacker.image_index >= _sound_frame)
            {
                audio_play_sound(_atk.attack_sound, 1, false);
                attack_sound_played = true;
            }
        }

        if (!instance_exists(_atk.attacker) || _atk.attacker.image_speed == 0)
        {
            state = "attacking_hit";
        }
    break;

    case "attacking_hit":
        var _atk = _round.attackers[attack_index];
        attack_popup = scr_king_damage(_atk.damage,
            variable_struct_exists(_atk, "color_top")    ? _atk.color_top    : c_white,
            variable_struct_exists(_atk, "color_bottom") ? _atk.color_bottom : c_white);
        timer = popup_clear_frames; // fallback in case the popup never spawned (e.g. King missing)
        state = "attacking_popup_wait";
    break;

    // hold until the damage number over King has fully faded before this character stands down
    case "attacking_popup_wait":
        var _atk = _round.attackers[attack_index];
        if (attack_popup != noone)
        {
            if (!instance_exists(attack_popup))
            {
                timer = variable_struct_exists(_atk, "post_attack_hold_frames") ? _atk.post_attack_hold_frames : 0;
                state = "attacking_post_hold";
            }
        }
        else
        {
            timer--;
            if (timer <= 0)
            {
                timer = variable_struct_exists(_atk, "post_attack_hold_frames") ? _atk.post_attack_hold_frames : 0;
                state = "attacking_post_hold";
            }
        }
    break;

    // optional extra pause on the attacker's last attack frame before reverting to idle
    // (post_attack_hold_frames on the attacker struct; not set = no extra wait, same as before)
    case "attacking_post_hold":
        timer--;
        if (timer <= 0)
        {
            state = "attacking_revert";
        }
    break;

    case "attacking_revert":
	    var _atk = _round.attackers[attack_index];
	    if (variable_struct_exists(_atk, "attacker") && variable_struct_exists(_atk, "idle_sprite") && instance_exists(_atk.attacker))
	    {
	        var _hold = variable_struct_exists(_atk, "idle_hold") && _atk.idle_hold;
	        with (_atk.attacker)
	        {
	            sprite_index = _atk.idle_sprite;
	            image_index = 0;
	            image_speed = _hold ? 0 : 1;
	            anim_loop = true;
	        }
	    }

	    // this character's own attack is done — drop their box back to inactive
	    // (lowered, normal art) instead of staying raised for the rest of the round
	    if (attack_index < array_length(members) && members[attack_index] != noone)
	    {
	        members[attack_index].selected_attack = false;
	    }

	    attack_index++;
	    timer = attack_settle_frames;
	    state = "attacking_between";
	break;

    case "attacking_between":
        timer--;
        if (timer <= 0)
        {
            state = "attacking_start";
        }
    break;

    case "talk_start":
	    if (_round != noone && array_length(_round.dialogue_batch) > 0)
	    {
	        var _chain = instance_create_depth(0, 0, 0, obj_dialogue_chain);
	        _chain.batches = [ _round.dialogue_batch ];
	        state = "talk_wait";
	    }
	    else
	    {
	        state = "king_attack_start";
	    }
	break;

	case "talk_wait":
	    if (!instance_exists(obj_dialogue_chain))
	    {
	        state = "king_attack_start";
	    }
	break;

	// spawns the real barrage if this round has one configured; otherwise
	// falls back to the old fixed-length placeholder gap
	case "king_attack_start":
	    if (_round != noone && variable_struct_exists(_round, "king_attack"))
	    {
	        with (obj_barrage_spawner) instance_destroy(); // clear any leftover
	        var _spawner = instance_create_depth(0, 0, 0, obj_barrage_spawner);
	        _spawner.data = _round.king_attack;
	        state = "king_attack_barrage_wait";
	    }
	    else
	    {
	        timer = king_attack_placeholder_frames;
	        state = "king_attack_wait";
	    }
	break;

	case "king_attack_barrage_wait":
	    if (!instance_exists(obj_barrage_spawner))
	    {
	        state = "advance_round";
	    }
	break;

	case "king_attack_wait":
	    timer--;
	    if (timer <= 0)
	    {
	        state = "advance_round";
	    }
	break;

	// King's cut-off line — plays like normal battle dialogue, but Lancer interrupts partway through
	case "final_dialogue_start":
	    var _chain = instance_create_depth(0, 0, 0, obj_dialogue_chain);
	    _chain.batches = [ _round.dialogue_batch ];
	    timer = lancer_interrupt_delay_frames;
	    state = "final_dialogue_wait";
	break;

	case "final_dialogue_wait":
	    timer--;
	    if (timer <= 0)
	    {
	        state = "lancer_enter_start";
	    }
	break;

	case "lancer_enter_start":
	    scr_dialogue_chain_interrupt(); // cuts King's line off mid-sentence
	    lancer_inst = instance_create_depth(lancer_spawn_x, lancer_spawn_y, -2000, obj_lancer);
	    lancer_inst.sprite_index = spr_lancer_right; // walking-in pose — swap to whatever fits the doorway he enters from
	    lancer_inst.image_speed = 1;
	    state = "lancer_enter_wait";
	break;

	case "lancer_enter_wait":
	    if (instance_exists(lancer_inst))
	    {
	        lancer_inst.x += lancer_walk_speed;
	        if (lancer_inst.x >= lancer_target_x)
	        {
	            lancer_inst.x = lancer_target_x;
	            lancer_inst.image_index = 0;
	            lancer_inst.image_speed = 0; // settle on an idle frame once he's "in"
	            state = "battle_end";
	        }
	    }
	    else
	    {
	        state = "battle_end";
	    }
	break;

	// hand off to whatever the rest of the cutscene does once Lancer's arrived
	// (e.g. advance dialogue_self / trigger the next case in scr_game_text) — fill in as that's written
	case "battle_end":
	    instance_destroy();
	break;
}