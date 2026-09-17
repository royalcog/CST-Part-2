if (!instance_exists(obj_UI)) exit; // everything anchors off obj_UI's position/slide state

var _vx = camera_get_view_x(view_camera[0]);
var _vy = camera_get_view_y(view_camera[0]);
var _gui_w = display_get_gui_width();
var _gui_h = display_get_gui_height();
var _view_w = camera_get_view_width(view_camera[0]);
var _view_h = camera_get_view_height(view_camera[0]);
var _scale_x = _gui_w / _view_w;
var _scale_y = _gui_h / _view_h;

var _base_x = obj_UI.x + box_offset_x;
var _base_y = obj_UI.y + box_offset_y;
var _sx = (_base_x - _vx) * _scale_x;
var _sy = (_base_y - _vy) * _scale_y;

// background frame — name + buttons baked in, icon/HP area left blank
draw_sprite_ext(sprite_frame, 0, _sx, _sy, _scale_x, _scale_y, 0, c_white, 1);

// icon — swaps to the hurt variant while hurt_timer is running
var _icon = (hurt_timer > 0) ? icon_hurt : icon_normal;
if (_icon != noone)
{
    draw_sprite_ext(_icon, 0, _sx + icon_offset_x * _scale_x, _sy + icon_offset_y * _scale_y, _scale_x, _scale_y, 0, c_white, 1);
}

// HP bar
var _bx = _sx + bar_offset_x * _scale_x;
var _by = _sy + bar_offset_y * _scale_y;
var _bw = bar_width * _scale_x;
var _bh = bar_height * _scale_y;
var _pct = clamp(hp_display / max_hp, 0, 1);

draw_rectangle_color(_bx, _by, _bx + _bw, _by + _bh, c_black, c_black, c_black, c_black, false);
draw_rectangle_color(_bx, _by, _bx + _bw * _pct, _by + _bh, c_aqua, c_aqua, c_aqua, c_aqua, false);

// HP number
draw_set_font(fnt_determination);
draw_set_halign(fa_right);
draw_text(_sx + hp_text_offset_x * _scale_x, _sy + hp_text_offset_y * _scale_y, string(round(hp_display)) + " / " + string(max_hp));
draw_set_halign(fa_left);