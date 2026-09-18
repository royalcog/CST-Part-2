function scr_king_damage(_amount, _color_top = c_white, _color_bottom = c_white)
{
    if (instance_exists(obj_king))
    {
        obj_king.king_hp = max(obj_king.king_hp - _amount, 0);
        scr_trigger_damage_popup(obj_king, _amount, _color_top, _color_bottom);
    }
}