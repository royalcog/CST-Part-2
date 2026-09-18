var _round = (round_index >= 0 && round_index < array_length(rounds)) ? rounds[round_index] : noone;

switch (state)
{
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
        if (array_length(members) > 0)
        {
            obj_UI.active_box = members[select_index];
        }
        timer = select_hold_frames;
        state = "select_wait";
    break;

    // Susie's box turns from normal -> attack, then Ralsei's, then Queen's — one at a time.
    // Whoever just chose stays "attack"-locked; the next one in line becomes the active box.
    case "select_wait":
        timer--;
        if (timer <= 0)
        {
            if (select_index < array_length(members))
            {
                members[select_index].selected_attack = true;
            }

            select_index++;

            if (select_index < array_length(members))
            {
                obj_UI.active_box = members[select_index];
                timer = select_hold_frames;
            }
            else
            {
                obj_UI.active_box = noone; // everyone's chosen — no box stays raised
                attack_index = 0;
                timer = attack_wind_up_frames;
                state = "attacking_wind_up";
            }
        }
    break;

    // attack animations play one at a time, each dealing its own damage to King
    case "attacking_wind_up":
        timer--;
        if (timer <= 0)
        {
            if (attack_index < array_length(_round.attackers))
            {
                var _atk = _round.attackers[attack_index];
                scr_king_damage(_atk.damage,
                    variable_struct_exists(_atk, "color_top")    ? _atk.color_top    : c_white,
                    variable_struct_exists(_atk, "color_bottom") ? _atk.color_bottom : c_white);
            }
            timer = attack_settle_frames;
            state = "attacking_settle";
        }
    break;

    case "attacking_settle":
        timer--;
        if (timer <= 0)
        {
            attack_index++;
            if (attack_index < array_length(_round.attackers))
            {
                timer = attack_wind_up_frames;
                state = "attacking_wind_up";
            }
            else
            {
                state = "talk_start";
            }
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

    // placeholder for King's own attack — unlike the SoJ/Friend fights, the party boxes stay
    // onscreen (inactive) through this instead of getting hidden. Real attacks slot in here later.
    case "king_attack_wait":
        timer--;
        if (timer <= 0)
        {
            state = "advance_round";
        }
    break;
}