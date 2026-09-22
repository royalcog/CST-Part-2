// --- tuning ---
spade_total      = 20;  // how many spades this attack throws
spawn_gap_min    = 8;   // "very minor delay" between spades, randomized a little
spawn_gap_max    = 12;
spade_speed      = 4;
spade_damage     = 36;
spade_scale      = 1;
spade_hit_radius = 12;  // spade center -> soul center; smaller than the art on purpose so it feels fair
start_delay      = 20;  // beat after the soul appears before the first spade
end_delay        = 30;  // beat after the last spade leaves before the box closes

spawned = 0;
timer = start_delay;
state = "spawning";