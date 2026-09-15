obj_kris.face = RIGHT;
obj_kris.image_speed = 0;

if (global.king_moved_x != noone)
{
    obj_king.x = global.king_moved_x;
    obj_king.y = global.king_moved_y;
}

obj_king.sprite_index = spr_king_walk_right;
obj_king.image_speed = 0;