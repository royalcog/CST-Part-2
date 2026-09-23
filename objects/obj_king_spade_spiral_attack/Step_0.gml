if (!instance_exists(obj_battlebox)) { instance_destroy(); exit; }

var _c = scr_box_center();
cx = _c.x;
cy = _c.y;

switch (state)
{
    case "windup":
        timer--;
        emitter_alpha = min(emitter_alpha + 1 / 20, 1);
        cur_spin = lerp(cur_spin, phases[0].spin, spin_ease); // already turning before it fires
        base_angle += cur_spin;

        if (timer <= 0)
        {
            phase_index = 0;
            phase_timer = 0;
            emit_timer  = 0;
            state = "firing";
        }
    break;

    case "firing":
        var _p = phases[phase_index];
        cur_spin = lerp(cur_spin, _p.spin, spin_ease);
        base_angle += cur_spin;

        emit_timer--;
        if (emit_timer <= 0)
        {
            for (var i = 0; i < _p.arms; i++)
            {
                var _a = base_angle + i * 360 / _p.arms;
                var _s = instance_create_depth(cx + lengthdir_x(spawn_radius, _a), cy + lengthdir_y(spawn_radius, _a),
                    obj_battlebox.depth - 1, obj_spade_shot);
                _s.move_dir    = _a;
                _s.image_angle = _a;
                _s.move_speed  = _p.speed;
                _s.max_speed   = _p.speed;
                _s.damage      = spade_damage;
                _s.hit_radius  = spade_hit_radius;
                _s.image_alpha = 1;    // no fade-in, so sitting on the emitter isn't a safe spot
                _s.entered     = true;
            }
            emit_timer = _p.gap;
        }

        phase_timer++;
        if (phase_timer >= _p.frames)
        {
            phase_index++;
            phase_timer = 0;
            if (phase_index >= array_length(phases))
            {
                timer = end_delay;
                state = "wind_down";
            }
        }
    break;

    case "wind_down":
        cur_spin = lerp(cur_spin, 0, spin_ease);
        base_angle += cur_spin;
        emitter_alpha = max(emitter_alpha - 1 / 20, 0);

        timer--;
        if (timer <= 0) instance_destroy();
    break;
}