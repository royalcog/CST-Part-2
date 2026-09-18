function scr_king_damage(_amount, _color_top = c_white, _color_bottom = c_white)
{
    if (!instance_exists(obj_king)) return noone;

    obj_king.king_hp = max(obj_king.king_hp - _amount, 0);
    audio_play_sound(snd_damagetaken, 1, false);
    return scr_trigger_damage_popup(obj_king, _amount, _color_top, _color_bottom, 60, 40); // further down/right on King's sprite — tune to taste
}