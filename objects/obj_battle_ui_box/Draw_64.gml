if (!instance_exists(obj_UI)) exit;

var _vx = camera_get_view_x(view_camera[0]);
var _vy = camera_get_view_y(view_camera[0]);
var _scale_x = display_get_gui_width()  / camera_get_view_width(view_camera[0]);
var _scale_y = display_get_gui_height() / camera_get_view_height(view_camera[0]);

var _sx = (obj_UI.x + box_offset_x - _vx) * _scale_x;
var _sy = (obj_UI.y + box_offset_y - _vy) * _scale_y;
var _s  = frame_scale; // shorthand

// background frame — swaps whole sprite between normal and hurt while flashing
var _frame = (hurt_timer > 0) ? hurt_frame : sprite_frame;
var _w = sprite_get_width(_frame);
draw_sprite_part_ext(_frame, 0, 0, 0, _w, divider_y, _sx, _sy, _scale_x * _s, _scale_y * _s, c_white, 1);

// HP bar fill — drawn on top of the baked #4C0000 track, shrinks left-to-right with hp
var _bx = _sx + bar_offset_x * _scale_x * _s;
var _by = _sy + bar_offset_y * _scale_y * _s;
var _bw = bar_width  * _scale_x * _s;
var _bh = bar_height * _scale_y * _s;
var _pct = clamp(hp_display / max_hp, 0, 1);
draw_rectangle_color(_bx, _by, _bx + _bw * _pct, _by + _bh, bar_fill_color, bar_fill_color, bar_fill_color, bar_fill_color, false);

// HP number — current sits right-aligned before the baked slash, max sits left-aligned after it
draw_set_font(fnt_determination);

var _cy = _sy + hp_text_offset_y * _scale_y * _s;

draw_set_halign(fa_right);
draw_text(_sx + hp_current_x * _scale_x * _s, _cy, string(round(hp_display)));

draw_set_halign(fa_left);
draw_text(_sx + hp_max_x * _scale_x * _s, _cy, string(max_hp));

draw_set_halign(fa_left);