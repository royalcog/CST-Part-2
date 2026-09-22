if (!instance_exists(obj_battlebox)) { instance_destroy(); exit; }
if (obj_battlebox.state == "closing") fading_out = true;

x += dir * move_speed;

// quick fade in on spawn, fade out once it's cleared the box
if (!fading_out)
{
    image_alpha = min(image_alpha + 1 / fade_frames, 1);
}
else
{
    image_alpha -= 1 / fade_frames;
    if (image_alpha <= 0) { instance_destroy(); exit; }
}

// hit only counts if the soul can actually take it; while it's flashing, spades pass through
if (instance_exists(obj_soul) && !obj_soul.invulnerable
 && point_distance(x, y, obj_soul.x, obj_soul.y) <= hit_radius)
{
    scr_soul_take_hit(damage, c_white, c_white);
    instance_destroy();
    exit;
}

var _in = scr_get_box_interior();
var _half_w = abs(sprite_width) / 2;
if (!fading_out && ((dir == 1 && x - _half_w > _in.x2 + travel_out) || (dir == -1 && x + _half_w < _in.x1 - travel_out)))
{
    fading_out = true;
}