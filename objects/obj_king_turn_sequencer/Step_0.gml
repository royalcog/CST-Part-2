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
            state = "talk_start";
            break;
        }

        var _atk = _round.attackers[attack_index];
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
            state = "attacking_anim_wait";
        }
        else
        {
            state = "attacking_hit";
        }
    break;

    case "attacking_anim_wait":
        var _atk = _round.attackers[attack_index];
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
        if (attack_popup != noone)
        {
            if (!instance_exists(attack_popup))
            {
                state = "attacking_revert";
            }
        }
        else
        {
            timer--;
            if (timer <= 0)
            {
                state = "attacking_revert";
            }
        }
    break;

    case "attacking_revert":
        var _atk = _round.attackers[attack_index];
        if (variable_struct_exists(_atk, "attacker") && variable_struct_exists(_atk, "idle_sprite") && instance_exists(_atk.attacker))
        {
            with (_atk.attacker)
            {
                sprite_index = _atk.idle_sprite;
                image_index = 0;
                image_speed = 1;
                anim_loop = true;
            }
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

    // dialogue for whatever part of the script this round represents, via the TALKbox system
    case "talk_start":
        if (_round != noone && array_length(_round.dialogue_batch) > 0)
        {
            var _chain = instance_create_depth(0, 0, 0, obj_dialogue_chain);
            _chain.batches = [ _round.dialogue_batch ];
            state = "talk_wait";
        }
        else
        {
            timer = king_attack_placeholder_frames;
            state = "king_attack_wait";
        }
    break;

    case "talk_wait":
        if (!instance_exists(obj_dialogue_chain))
        {
            timer = king_attack_placeholder_frames;
            state = "king_attack_wait";
        }
    break;

    // placeholder for King's own attack — party boxes stay onscreen (inactive) through this
    // instead of getting hidden. Real attacks slot in here later.
    case "king_attack_wait":
        timer--;
        if (timer <= 0)
        {
            state = "advance_round";
        }
    break;
}