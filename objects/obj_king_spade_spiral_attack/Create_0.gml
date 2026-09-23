// --- tuning ---
// phases play in order; spin (deg/frame) eases between phases so each reversal is readable
phases = [
    { frames: 200, arms: 3, spin: 3,    gap: 8, speed: 2   },
    { frames: 200, arms: 3, spin: -3.5, gap: 8, speed: 2.2 },
    { frames: 220, arms: 4, spin: 4,    gap: 9, speed: 2.4 },
    { frames: 220, arms: 4, spin: -5,   gap: 9, speed: 2.6 }
];
windup_frames    = 60;   // emitter blinks at the center first — soul starts here, so this is the "move!" warning
spin_ease        = 0.04;
spawn_radius     = 12;   // spades come out from the edge of the emitter
emitter_scale    = 1.5;
spade_damage     = 36;
spade_hit_radius = 12;
end_delay        = 60;   // emitter fades out, then the box closes
windup_sound     = snd_spear_appear; // -1 for none

// --- state ---
depth = obj_battlebox.depth - 1;
state = "windup";
timer = windup_frames;
phase_index = 0;
phase_timer = 0;
emit_timer  = 0;
base_angle  = random(360);
cur_spin    = 0;
emitter_alpha = 0;

var _c = scr_box_center();
cx = _c.x;
cy = _c.y;

with (obj_box_bullet_drawer) instance_destroy(); // clear any leftover
instance_create_depth(0, 0, obj_battlebox.depth - 1, obj_box_bullet_drawer);

if (windup_sound != -1) audio_play_sound(windup_sound, 5, false);