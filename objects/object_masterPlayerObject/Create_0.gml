/// Player Script What What

// State machine
state = 0;
customState = 0;

// Flags
doPause = false;
doRoomTransition = false;
doSelectAsMainCharacter = false;
doDeselectAsMainCharacter = false;
doControl = false;


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

// Current Character Sprite Info
sprite_walk_forward = sprite_tempPlayerMaxine_walkFront;
sprite_walk_behind = sprite_tempPlayerMaxine_walkBehind;
sprite_walk_left = sprite_tempPlayerMaxine_walkLeft;
sprite_walk_right = sprite_tempPlayerMaxine_walkRight;


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

// Homing Attack
homingAttackState = 0;
homingAttackTimer = 0;

// Player Interaction
playerInteractionState = 0;
playerInteractionTimer = 0;

// Player Menu
playerMenuState = 0;
playerMenuTimer = 0;

// Follow vars
objectToFollow = asset_object;
doFollow = false;
distanceFromObjectToFollow = 0;
minimumDistanceFromObjectToFollow = 20;
maximumDistanceFromObjectToFollow = 30;

