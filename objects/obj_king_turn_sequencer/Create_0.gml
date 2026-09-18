// each round: { attackers: [ { box_name, damage, color_top, color_bottom }, ... x3 in Susie/Ralsei/Queen order ],
//               dialogue_batch: [ { speaker, text }, ... ] }  -- dialogue_batch can be [] to skip that beat
rounds = [];
round_index = -1;

state = "advance_round";
timer = 0;

select_index = 0;
attack_index = 0;

// order matches scr_party_init's creation order (Susie, Ralsei, Queen) — grabbed once here
// since the boxes persist for the whole fight
members = [];
with (obj_battle_ui_box)
{
    array_push(other.members, id);
}

select_hold_frames          = 30; // how long each box sits "active" before locking into its attack pose
attack_wind_up_frames       = 20; // beat before damage actually lands
attack_settle_frames        = 20; // hang time after damage before moving to the next attacker
king_attack_placeholder_frames = 60; // stand-in for King's own attack until that's built