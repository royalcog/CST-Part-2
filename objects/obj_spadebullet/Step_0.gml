if (!instance_exists(obj_battlebox)) { instance_destroy(); exit; }

x += dir * move_speed;

// hit only counts if the soul can actually take it; while it's flashing, spades pass through
if (instance_exists(obj_soul) && !obj_soul.invulnerable
 && point_distance(x, y, obj_soul.x, obj_soul.y) <= hit_radius)
{
    scr_soul_take_hit(damage, c_white, c_white);
    instance_destroy();
    exit;
}

// gone once it's fully past the far wall
var _in = scr_get_box_interior();
var _half_w = abs(sprite_width) / 2;
if ((dir == 1 && x - _half_w > _in.x2) || (dir == -1 && x + _half_w < _in.x1))
{
    instance_destroy();
}