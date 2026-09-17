use_party_boxes = false;
image_xscale = 1;
image_yscale = 1;
var _camx = camera_get_view_x(view_camera[0]);
var _camy = camera_get_view_y(view_camera[0]);
var _camw = camera_get_view_width(view_camera[0]);
var _camh = camera_get_view_height(view_camera[0]);
// total on-screen width of the party panel, once all three boxes are scaled to their target size
var _party_width = 236 + 238 + 224; // Susie + Ralsei + Queen scaled widths — update if you add/remove characters
var _margin = 20; // gap from the screen edge

target_x = _camx + _camw - _party_width - _margin; // right-anchor the whole panel with a fixed margin
x = _camx + _camw + sprite_width * image_xscale; // start off screen right
y = _camy + _camh - 10;

offscreen_x = x; // <-- remember this starting position so we can send it back later
onscreen_x = target_x; // remember the real onscreen position so we can return to it later

if room = rm_one
{
    sprite_index = spr_UI_SCP;
}
if room = rm_two
{
    sprite_index = spr_UI_SCP;
}
if room = rm_three
{
    sprite_index = spr_UI_Pink;	
}