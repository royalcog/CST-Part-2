function scr_party_init(_members)
{
    global.party = _members;

    with (obj_battle_ui_box) instance_destroy(); // clear any leftover boxes from a previous fight

    for (var i = 0; i < array_length(_members); i++)
    {
        var _m = _members[i];
        var _box = instance_create_depth(0, 0, -100, obj_battle_ui_box);

        _box.char_name        = _m.name;
        _box.hp               = _m.hp;
        _box.max_hp           = _m.max_hp;
        _box.hp_current_x     = _m.hp_current_x;
		_box.hp_max_x         = _m.hp_max_x;
		_box.hp_text_offset_y = _m.hp_text_offset_y;
        _box.sprite_frame     = _m.sprite_frame;
		_box.hurt_frame       = _m.hurt_frame;
		_box.frame_scale      = _m.frame_scale;
		_box.bar_offset_x     = _m.bar_offset_x;
		_box.bar_offset_y     = _m.bar_offset_y;
		_box.bar_width        = _m.bar_width;
		_box.bar_height       = _m.bar_height;
		_box.bar_fill_color   = _m.bar_fill_color;
		_box.hp_current_x     = _m.hp_current_x;
		_box.hp_max_x         = _m.hp_max_x;
		_box.hp_text_offset_y = _m.hp_text_offset_y;
		_box.hurt_flash_time  = _m.hurt_flash_time;
		_box.box_offset_x     = _m.box_offset_x;
		_box.box_offset_y     = _m.box_offset_y;
		_box.divider_y	      = _m.divider_y;
		_box.icon_rect_x     = _m.icon_rect_x;
		_box.icon_rect_y     = _m.icon_rect_y;
		_box.icon_rect_w     = _m.icon_rect_w;
		_box.icon_rect_h     = _m.icon_rect_h;
		_box.hurt_icon_scale = _m.hurt_icon_scale;
		
		if (i == 0) obj_UI.active_box = _box;
    }

    obj_UI.use_party_boxes = true; // tell obj_UI to stop drawing its own sprite and let the boxes handle it
}

