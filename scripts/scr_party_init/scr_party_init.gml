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
        _box.box_offset_x     = _m.box_offset_x; // position relative to obj_UI, matching the old combined-panel layout
        _box.box_offset_y     = _m.box_offset_y;
        _box.sprite_frame     = _m.sprite_frame; // background box art: name + buttons, icon/HP area left blank
        _box.icon_normal      = _m.icon_normal;
        _box.icon_hurt        = _m.icon_hurt;
        _box.icon_offset_x    = _m.icon_offset_x;
        _box.icon_offset_y    = _m.icon_offset_y;
        _box.bar_offset_x     = _m.bar_offset_x;
        _box.bar_offset_y     = _m.bar_offset_y;
        _box.bar_width        = _m.bar_width;
        _box.bar_height       = _m.bar_height;
        _box.hp_text_offset_x = _m.hp_text_offset_x;
        _box.hp_text_offset_y = _m.hp_text_offset_y;
        _box.hurt_flash_time  = _m.hurt_flash_time; // per-character, e.g. 20 frames
    }

    obj_UI.use_party_boxes = true; // tell obj_UI to stop drawing its own sprite and let the boxes handle it
}