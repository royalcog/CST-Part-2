if (use_party_boxes)
{
    if (instance_exists(active_box))
    {
        var _correction = boxes_x_correction;
        with (active_box)
        {
            var _vx = camera_get_view_x(view_camera[0]);
            var _vy = camera_get_view_y(view_camera[0]);
            var _scale_x = display_get_gui_width()  / camera_get_view_width(view_camera[0]);
            var _scale_y = display_get_gui_height() / camera_get_view_height(view_camera[0]);
            var _sx = (obj_UI.x + box_offset_x + _correction - _vx) * _scale_x;
            var _sy = (obj_UI.y + box_offset_y - _vy) * _scale_y;

            var _frame = (hurt_timer > 0) ? hurt_frame : sprite_frame;
            var _w = sprite_get_width(_frame);
            var _h = sprite_get_height(_frame);
            var _button_h = _h - divider_y;

            draw_sprite_part_ext(_frame, 0, 0, divider_y, _w, _button_h,
                _sx, _sy + divider_y * _scale_y * frame_scale,
                _scale_x * frame_scale, _scale_y * frame_scale, c_white, 1);
        }
    }
    exit;
}

var _vx = camera_get_view_x(view_camera[0]);
var _vy = camera_get_view_y(view_camera[0]);
var _gui_w = display_get_gui_width();
var _gui_h = display_get_gui_height();
var _view_w = camera_get_view_width(view_camera[0]);
var _view_h = camera_get_view_height(view_camera[0]);
var _scale_x = _gui_w / _view_w;
var _scale_y = _gui_h / _view_h;

var _sx = (x - _vx) * _scale_x;
var _sy = (y - _vy) * _scale_y;
draw_sprite_ext(sprite_index, image_index, _sx, _sy, image_xscale * _scale_x, image_yscale * _scale_y, image_angle, c_white, 1);

