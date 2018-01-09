/// Player Script What What

// Basic Movement Vars
move_speed = 4;
movement_x = 0;
movement_y = 0;

// Tile Map Info
collisionLayer = layer_get_id("collision_map");
collisionTilemap = layer_tilemap_get_id(collisionLayer);
doUpdateTileset = false;

// Sprite Info
sprite_bbox_left = sprite_get_bbox_left(sprite_index) - sprite_get_xoffset(sprite_index);
sprite_bbox_right = sprite_get_bbox_right(sprite_index) - sprite_get_xoffset(sprite_index);
sprite_bbox_bottom = sprite_get_bbox_bottom(sprite_index) - sprite_get_yoffset(sprite_index);
sprite_bbox_top = sprite_get_bbox_top(sprite_index) - sprite_get_yoffset(sprite_index);