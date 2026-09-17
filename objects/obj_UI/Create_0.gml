use_party_boxes = false;
image_xscale = 1;
image_yscale = 1;
var _camx = camera_get_view_x(view_camera[0]);
var _camy = camera_get_view_y(view_camera[0]);
var _camw = camera_get_view_width(view_camera[0]);
var _camh = camera_get_view_height(view_camera[0]);
// total on-screen width of the party panel, once all three boxes are scaled to their target size
var _party_width = 643;
target_x = _camx + (_camw - _party_width) / 2; // ≈ _camx + 105
x = _camx + _camw + sprite_width * image_xscale; // start off screen right
y = _camy + _camh - 10;

offscreen_x = x; // <-- remember this starting position so we can send it back later
onscreen_x = target_x; // remember the real onscreen position so we can return to it later

active_box = noone; // which obj_battle_ui_box currently shows its button row

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