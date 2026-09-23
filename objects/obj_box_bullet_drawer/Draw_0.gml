if (!instance_exists(obj_battlebox)) exit;
if (instance_number(obj_spade_burst) == 0 && instance_number(obj_spade_shot) == 0) exit;

var _in = scr_get_box_interior();
var _ox = floor(_in.x1);
var _oy = floor(_in.y1);
var _w  = max(1, ceil(_in.x2) - _ox);
var _h  = max(1, ceil(_in.y2) - _oy);

if (!surface_exists(surf) || surface_get_width(surf) != _w || surface_get_height(surf) != _h)
{
    if (surface_exists(surf)) surface_free(surf);
    surf = surface_create(_w, _h);
}

// draw every box bullet onto an interior-sized surface, so anything outside the box just gets cut off
surface_set_target(surf);
draw_clear_alpha(c_black, 0);
with (obj_spade_burst)
{
    draw_sprite_ext(sprite_index, image_index, round(x) - _ox, round(y) - _oy,
        image_xscale, image_yscale, image_angle, image_blend, image_alpha);
}
with (obj_spade_shot)
{
    draw_sprite_ext(sprite_index, image_index, round(x) - _ox, round(y) - _oy,
        image_xscale, image_yscale, image_angle, image_blend, image_alpha);
}
surface_reset_target();

draw_surface(surf, _ox, _oy);