function scr_party_damage(_amount)
{
    var _candidates = [];
    with (obj_battle_ui_box)
    {
        if (hp > 0) array_push(_candidates, id);
    }

    if (array_length(_candidates) == 0) exit; // whole party's down

    var _target = _candidates[irandom(array_length(_candidates) - 1)];

    with (_target)
    {
        hp = max(hp - _amount, 0);
        hurt_timer = hurt_flash_time;
    }
}