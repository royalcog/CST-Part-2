if (!instance_exists(obj_battlebox)) { instance_destroy(); exit; }

switch (state)
{
    case "tossing":
        timer--;
        if (timer > 0) break;

        var _wave = waves[wave_index];
        toss_bomb(_wave.cluster && tossed > 0);
        tossed++;

        if (tossed >= _wave.bombs) state = "wave_wait";
        else timer = _wave.gap;
    break;

    case "wave_wait":
        if (instance_number(obj_spade_bomb) == 0)
        {
            wave_index++;
            tossed = 0;

            if (wave_index >= array_length(waves))
            {
                timer = end_delay;
                state = "end_hold";
            }
            else
            {
                timer = wave_pause;
                state = "tossing";
            }
        }
    break;

    // end while the last ring is still flying, so the box closes on it like attack 1
    case "end_hold":
        timer--;
        if (timer <= 0) instance_destroy();
    break;
}