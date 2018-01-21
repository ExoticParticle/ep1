/// Player Script What What

// State machine
state = 0;

doPause = false;

doRoomTransition = false;

// Basic Movement Vars
movement_x = 0;
movement_y = 0;
facingDirection = 0;

// Tile Map Info
collisionLayer = layer_get_id("collision_map");
collisionTilemap = layer_tilemap_get_id(collisionLayer);
doUpdateTileset = false;

// Sprite Info
sprite_bbox_left = sprite_get_bbox_left(sprite_index) - sprite_get_xoffset(sprite_index);
sprite_bbox_right = sprite_get_bbox_right(sprite_index) - sprite_get_xoffset(sprite_index);
sprite_bbox_bottom = sprite_get_bbox_bottom(sprite_index) - sprite_get_yoffset(sprite_index);
sprite_bbox_top = sprite_get_bbox_top(sprite_index) - sprite_get_yoffset(sprite_index);

// Attack Vars
attackPositionOffsetX = 0;
attackPositionOffsetY = 0;

// Basic Attack Logic
basicAttackOffset = 5;
basicAttackState = 0;
basicAttackTimer = 0;

// Special Attack 
specialAttackState = 0;
specialAttackTimer = 0;

// Player Interaction
playerInteractionState = 0;
playerInteractionTimer = 0;

// Player Menu
playerMenuState = 0;
playerMenuTimer = 0;


