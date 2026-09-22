switch (state)
{
    case "spawning":
        if (!instance_exists(obj_battlebox)) { instance_destroy(); exit; }

        timer--;
        if (timer <= 0)
        {
            var _in = scr_get_box_interior();
            var _half_w = sprite_get_width(spr_spade) * spade_scale / 2;
            var _side = choose(-1, 1); // -1 = enters from the left, 1 = enters from the right

            var _sx = (_side == -1) ? (_in.x1 - _half_w) : (_in.x2 + _half_w);
            var _sy = random_range(_in.y1 + 6, _in.y2 - 6);

            var _s = instance_create_depth(_sx, _sy, obj_battlebox.depth - 1, obj_spade);
            _s.dir          = -_side; // travels toward the opposite side
            _s.move_speed   = spade_speed;
            _s.damage       = spade_damage;
            _s.hit_radius   = spade_hit_radius;
            _s.image_xscale = spade_scale * _s.dir; // sprite points right, so flip it for right-side spades
            _s.image_yscale = spade_scale;

            spawned++;
            if (spawned >= spade_total) state = "clearing";
            else timer = irandom_range(spawn_gap_min, spawn_gap_max);
        }
    break;

    case "clearing":
        if (instance_number(obj_spade) == 0)
        {
            timer = end_delay;
            state = "end_hold";
        }
    break;

    case "end_hold":
        timer--;
        if (timer <= 0) instance_destroy();
    break;
}