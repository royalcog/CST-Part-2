// each round: { attackers: [ { box_name, damage, color_top, color_bottom,
//                              attacker (optional), attack_sprite (optional), idle_sprite (optional) }, ... x3 in Susie/Ralsei/Queen order ],
//               dialogue_batch: [ { speaker, text }, ... ] }  -- dialogue_batch can be [] to skip that beat
rounds = [];
round_index = -1;

state = "waiting_ui_settle";
timer = 60; // ~1 second hold once obj_UI finishes sliding onscreen, before the selection sequence starts

select_index = 0;
attack_index = 0;
attack_popup = noone;
attack_sound_played = false; // reset per-attacker; lets attack_sound_frame delay the swing sfx to a specific anim frame

// explicit lookup by name (NOT instance/creation order, which isn't guaranteed) so the
// selection queue is always Susie -> Ralsei -> Queen
members = array_create(3, noone);
var _order = ["Susie", "Ralsei", "Queen"];
for (var i = 0; i < array_length(_order); i++)
{
    with (obj_battle_ui_box)
    {
        if (char_name == _order[i])
        {
            other.members[i] = id;
        }
    }
}

select_hold_frames    = 30; // how long a box sits "active" (plain) before locking into its attack pose
select_confirm_frames = 20; // how long the highlighted attack pose shows, still active, before moving on
attack_settle_frames  = 20; // small gap after one attacker's turn finishes before the next one starts
popup_clear_frames    = 30; // fallback wait if a hit's popup never spawned (matches the popup's own life)
king_attack_placeholder_frames = 60; // stand-in for King's own attack until that's built

// --- final round: King's cut-off line + Lancer walking in to end the battle ---
lancer_inst = noone;
lancer_interrupt_delay_frames = 90; // how far into King's last line before Lancer cuts him off — tune to taste (~1.5s)
lancer_spawn_x  = 380; lancer_spawn_y  = 500; // he walks straight up into place, so x stays fixed
lancer_target_x = 380; lancer_target_y = 360; // where he stops moving and turns, facing right, sad
lancer_walk_speed = 1.5; // vertical walk-up speed — keep this gentle, not a fast walk