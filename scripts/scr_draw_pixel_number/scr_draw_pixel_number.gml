/// scr_draw_pixel_number_rects(_x, _y, _text, _halign, _digit_gap, _scale, _color)
///
/// Draws a string of digits as plain filled rectangles (via scr_digit_rects),
/// matching the hammerbox reference art's blocky segmented-display style.
/// No font, no sprite asset — just draw_rectangle_color, so there's nothing
/// that needs to be imported/recognized and nothing that can be scaled
/// unevenly or blurred by interpolation.
///
/// _digit_gap: px of space between one digit and the next, in final screen px.
/// _scale: integer zoom (1 = native 6x10, 2 = 12x20, etc.) — keep this a
/// whole number so every rectangle edge still lands on a whole pixel.
/// _color: fill color.
/// _halign: fa_left (anchor _x at the left edge) or fa_right (anchor _x at
/// the right edge, growing left).
function scr_draw_pixel_number_rects(_x, _y, _text, _halign, _digit_gap, _scale, _color)
{
    var _digit_w = 6 * _scale;
    var _digit_h = 10 * _scale;
    var _gap = round(_digit_gap);

    var _len = string_length(_text);
    var _pitch = _digit_w + _gap;
    var _total_w = (_len * _digit_w) + (max(0, _len - 1) * _gap);

    var _start_x = round((_halign == fa_right) ? (_x - _total_w) : _x);
    var _draw_y = round(_y);

    for (var _i = 1; _i <= _len; _i++)
    {
        var _ch = string_char_at(_text, _i);
        var _digit = real(_ch); // "0".."9" -> 0..9

        var _dx = _start_x + (_i - 1) * _pitch;
        var _rects = scr_digit_rects(_digit);

        for (var _r = 0; _r < array_length(_rects); _r++)
        {
            var _rc = _rects[_r];
            var _rx0 = _dx      + _rc[0] * _scale;
            var _ry0 = _draw_y  + _rc[1] * _scale;
            var _rx1 = _dx      + _rc[2] * _scale;
            var _ry1 = _draw_y  + _rc[3] * _scale;

            draw_rectangle_color(_rx0, _ry0, _rx1 - 1, _ry1 - 1, _color, _color, _color, _color, false);
        }
    }
}