// --- tuning ---
// each wave: how many bombs, frames between tosses, and whether bombs after the first land near it
waves = [
    { bombs: 1, gap: 0,  cluster: false },
    { bombs: 1, gap: 0,  cluster: false },
    { bombs: 2, gap: 30, cluster: false },
    { bombs: 2, gap: 18, cluster: false },
    { bombs: 3, gap: 12, cluster: true  }  // close together so the rings overlap
];
wave_pause     = 40;  // after a wave's bombs have all burst, before the next wave
start_delay    = 20;  // beat after the soul appears before the first toss
end_delay      = 25;  // after the last burst, before the box closes (ring spades still flying)
land_margin    = 28;  // bombs land at least this far from the walls
cluster_radius = 60;  // how close clustered bombs land to the first one
toss_offset_x  = -30; // where the toss starts, relative to King
toss_offset_y  = -80;
toss_sound     = snd_bombfall; // -1 for none

// --- state ---
wave_index = 0;
tossed     = 0;
timer      = start_delay;
state      = "tossing";
cluster_x  = 0;
cluster_y  = 0;

with (obj_box_bullet_drawer) instance_destroy(); // clear any leftover
instance_create_depth(0, 0, obj_battlebox.depth - 1, obj_box_bullet_drawer);

toss_bomb = function(_near_first)
{
    var _in = scr_get_box_interior();
    var _lx, _ly;

    if (_near_first)
    {
        _lx = clamp(cluster_x + random_range(-cluster_radius, cluster_radius), _in.x1 + land_margin, _in.x2 - land_margin);
        _ly = clamp(cluster_y + random_range(-cluster_radius, cluster_radius), _in.y1 + land_margin, _in.y2 - land_margin);
    }
    else
    {
        _lx = random_range(_in.x1 + land_margin, _in.x2 - land_margin);
        _ly = random_range(_in.y1 + land_margin, _in.y2 - land_margin);
        cluster_x = _lx;
        cluster_y = _ly;
    }

    var _sx = instance_exists(obj_king) ? obj_king.x + toss_offset_x : _in.x2 + 200;
    var _sy = instance_exists(obj_king) ? obj_king.y + toss_offset_y : _in.y1 - 100;

    var _b = instance_create_depth(_sx, _sy, obj_battlebox.depth - 1, obj_spade_bomb);
    _b.start_x = _sx;
    _b.start_y = _sy;
    _b.land_x  = _lx;
    _b.land_y  = _ly;

    if (toss_sound != -1) audio_play_sound(toss_sound, 5, false);
};