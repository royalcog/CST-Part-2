char_name = "";
hp = 0;
max_hp = 1;
box_offset_x = 0;
box_offset_y = 0;
sprite_frame = spr_queenbox_empty;
hurt_frame = spr_queenbox_hurtempty;
frame_scale = 1;
bar_offset_x = 0;
bar_offset_y = 0;
bar_width = 80;
bar_height = 6;
bar_fill_color = c_white;
hp_current_x = 0;
hp_max_x = 0;
hp_text_offset_y = 0;
hurt_flash_time = 20;

hurt_timer = 0;
hp_display = hp;
hp_digit_w = 8;   // each digit's rendered ink width, in native px
hp_digit_h = 12;  // each digit's rendered ink height, in native px
hp_digit_gap = 1; // px of space between one digit and the next
hp_digit_y_offset = -2; // nudge the whole HP number up/down, in final screen px (independent of each box's frame_scale)

// trying fnt_determination instead of fnt_greaterdetermination for a bit —
// swap hp_font + hp_font_native_w/h together to switch back
hp_font = fnt_determination;
hp_font_native_w = 6; // fnt_determination's own baked digit ink width (native px)
hp_font_native_h = 9; // fnt_determination's own baked digit ink height (native px)

divider_y = 156;
inactive_rest_offset = 24;
icon_rect_x = 0; icon_rect_y = 0; icon_rect_w = 0; icon_rect_h = 0; // where the face sits within the box art (native px)
hurt_icon_scale = 1; // shrink the hurt face relative to the normal one — 1 = same size, 0.8 = 20% smaller
active_raise_offset = 8; // how far up the active box lifts compared to resting position