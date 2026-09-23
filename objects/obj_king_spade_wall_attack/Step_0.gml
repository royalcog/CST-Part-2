if (!instance_exists(obj_battlebox)) { instance_destroy(); exit; }

switch (state)
{
    case "walls":
        timer--;
        if (timer > 0) break;

        var _w;
        do
        {
            _w = walls[wall_index];
            spawn_wall(_w);
            wall_index++;
        }
        until (!(variable_struct_exists(_w, "with_next") && _w.with_next) || wall_index >= array_length(walls));

        if (spawn_sound != -1) audio_play_sound(spawn_sound, 5, false);

        if (wall_index >= array_length(walls))
        {
            timer = end_delay;
            state = "end_hold";
        }
        else
        {
            timer = _w.wait;
        }
    break;

    case "end_hold":
        timer--;
        if (timer <= 0) instance_destroy();
    break;
}