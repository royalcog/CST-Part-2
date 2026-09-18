/// scr_draw_pixel_number_sprite(_x, _y, _text, _halign, _digit_gap, _scale, _color)
///
/// Draws a string of digits using spr_hp_digits — a hand-authored 6x10px
/// digit set (frames 0-9, one per digit character), so numbers render
/// pixel-perfect at native size with no font scaling or interpolation
/// involved at all. This is what makes it match baked reference art like
/// the hammerbox mockup exactly, rather than approximating it.
///
/// _digit_gap: px of space between one digit and the next, in final
/// screen px (same convention as scr_draw_pixel_number's gap).
/// _scale: integer zoom (1 = native 6x10, 2 = 12x20, etc.). Keep this a
/// whole number — a fractional scale here reintroduces the same uneven
/// scaling a stretched font would have.
/// _color: draw_sprite_ext blend color (c_white for no tint).
/// _halign: fa_left (anchor _x at the left edge) or fa_right (anchor _x at
/// the right edge, growing left).
function scr_draw_pixel_number_sprite(_x, _y, _text, _halign, _digit_gap, _scale, _color)
{
    var _digit_w = 6 * _scale;
    var _digit_h = 10 * _scale;
    var _gap = round(_digit_gap);

    var _len = string_length(_text);
    var _pitch = _digit_w + _gap;
    var _total_w = (_len * _digit_w) + (max(0, _len - 1) * _gap);

    var _start_x = round((_halign == fa_right) ? (_x - _total_w) : _x);
    var _draw_y = round(_y);

    var _prev_filter = gpu_get_texfilter();
    gpu_set_texfilter(false);

    for (var _i = 1; _i <= _len; _i++)
    {
        var _ch = string_char_at(_text, _i);
        var _frame = real(_ch); // "0".."9" -> 0..9, matching spr_hp_digits' frame order

        draw_sprite_ext(spr_hp_digits, _frame, _start_x + (_i - 1) * _pitch, _draw_y, _scale, _scale, 0, _color, 1);
    }

    gpu_set_texfilter(_prev_filter);
}