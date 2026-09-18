/// scr_draw_pixel_number(_x, _y, _text, _halign, _digit_w, _digit_h, _digit_gap, _native_w, _native_h)
///
/// Draws a string of digits so each character's actual ink is forced to an
/// exact _digit_w x _digit_h pixel size, with exactly _digit_gap pixels
/// between one digit's ink and the next's. The font must already be set
/// with draw_set_font() before calling this.
///
/// _native_w/_native_h are the current font's own baked digit ink size
/// (native px, before any scaling) — the reference size we scale down (or
/// up) from to hit _digit_w x _digit_h exactly. This differs per font, so
/// the caller passes whatever's right for whichever font is set.
///
/// _halign: fa_left (anchor _x at the left edge) or fa_right (anchor _x at
/// the right edge, growing left) — vertical alignment is left to the caller
/// via _y, same as before.
function scr_draw_pixel_number(_x, _y, _text, _halign, _digit_w, _digit_h, _digit_gap, _native_w, _native_h)
{
    var _scale_x = _digit_w / _native_w;
    var _scale_y = _digit_h / _native_h;

    var _len = string_length(_text);
    var _pitch = _digit_w + _digit_gap;
    var _total_w = (_len * _digit_w) + (max(0, _len - 1) * _digit_gap);

    var _start_x = (_halign == fa_right) ? (_x - _total_w) : _x;

    var _prev_halign = draw_get_halign();
    draw_set_halign(fa_left);

    for (var _i = 1; _i <= _len; _i++)
    {
        var _ch = string_char_at(_text, _i);
        draw_text_transformed(_start_x + (_i - 1) * _pitch, _y, _ch, _scale_x, _scale_y, 0);
    }

    draw_set_halign(_prev_halign);
}