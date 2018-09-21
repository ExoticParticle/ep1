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
doReset = false;

// Basic Movement Vars
movement_x = 0;
movement_y = 0;
facingDirection = 0;
movement_movementType = 0;

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
// Idle Suite
sprite_idle_forward = maxineidledowntemp;
sprite_idle_behind = maxineidleuptemp;
sprite_idle_left = maxineidlelefttemp;
sprite_idle_right = maxineidlerighttemp;
// Walk Suite
sprite_walk_forward = maxinewalkdowntemp;
sprite_walk_behind = maxinewalkuptemp;
sprite_walk_left = maxinewalklefttemp;
sprite_walk_right = maxinewalkrighttemp;
// Run Suite
sprite_run_forward = maxinerundowntemp;
sprite_run_behind = maxinerunuptemp;
sprite_run_left = maxinerunlefttemp;
sprite_run_right = maxinerunrighttemp;

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

