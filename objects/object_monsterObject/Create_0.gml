// State machine
state = 0;
customState = 0;

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

// Homing Attack
homingAttackState = 0;
homingAttackTimer = 0;

// Follow vars
objectToFollow = asset_object;
doFollow = false;
distanceFromObjectToFollow = 0;
minimumDistanceFromObjectToFollow = 20;
maximumDistanceFromObjectToFollow = 30;