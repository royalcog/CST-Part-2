// --- tuning ---
attack_duration  = 540; // frames of spade-spawning (~9s) — raise/lower to change how long the attack lasts
spawn_gap_min    = 8;   // "very minor delay" between spades, randomized a little
spawn_gap_max    = 12;
spade_speed      = 4;
spade_damage     = 36;
spade_scale      = 1;
spade_hit_radius = 12;  // spade center -> soul center; smaller than the art on purpose so it feels fair
spade_spawn_offset = 20; // how far outside the box spades appear / keep flying before fading out
start_delay      = 20;  // beat after the soul appears before the first spade

attack_timer = 0;
timer = start_delay;