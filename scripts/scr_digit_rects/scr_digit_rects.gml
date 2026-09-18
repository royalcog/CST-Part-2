/// scr_digit_rects(_digit)
///
/// Returns _digit's (0-9) ink as a list of [x0, y0, x1, y1] rectangles, in
/// native 6x10-px units (y-down, x1/y1 exclusive) — the same blocky
/// segmented-display shapes matched against the hammerbox reference art.
/// Used by scr_draw_pixel_number_rects to draw digits with plain filled
/// rectangles: no font, no sprite, nothing that needs importing or can
/// silently fail to load — just a built-in draw call.
function scr_digit_rects(_digit)
{
    switch (_digit)
    {
        case 0: return [[0,0,6,2],[0,2,2,8],[4,2,6,8],[0,8,6,10]];
        case 1: return [[0,0,4,2],[2,2,4,8],[0,8,6,10]];
        case 2: return [[0,0,6,2],[4,2,6,4],[0,4,6,6],[0,6,2,8],[0,8,6,10]];
        case 3: return [[0,0,6,2],[4,2,6,4],[0,4,6,6],[4,6,6,8],[0,8,6,10]];
        case 4: return [[0,2,2,4],[4,2,6,4],[0,4,6,6],[4,6,6,8]];
        case 5: return [[0,0,6,2],[0,2,2,4],[0,4,6,6],[4,6,6,8],[0,8,6,10]];
        case 6: return [[0,0,6,2],[0,2,2,4],[0,4,6,6],[0,6,2,8],[4,6,6,8],[0,8,6,10]];
        case 7: return [[0,0,6,2],[4,2,6,8]];
        case 8: return [[0,0,6,2],[0,2,2,4],[4,2,6,4],[0,4,6,6],[0,6,2,8],[4,6,6,8],[0,8,6,10]];
        case 9: return [[0,0,6,2],[0,2,2,4],[4,2,6,4],[0,4,6,6],[4,6,6,8],[0,8,6,10]];
    }
    return [];
}