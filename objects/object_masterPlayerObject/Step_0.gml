// Main Player Run

switch(state)
{
	case 0:
		// State 0 - First Frame Init - either control this character or don't
		doUpdateTileset = true;
		if(doControl)
		{
			state = 10;
		}
		else
		{

			
			state = 50;
		}
		break;
	case 10:
		// State 10 - Setup Player
		show_debug_message("Activating control for character: " + string(id));
		camera_set_view_target(view_camera[0],id);
		state = 20;
		break;
	case 20:
		// State 20 - Run Player
		script_playerMovementLogic();
		if(facingDirection == 0){
			switch(movement_movementType){
				case 0:
					sprite_index = sprite_idle_behind;
					break;
				case 1:
					sprite_index = sprite_walk_behind;
					break;
				case 2:
					sprite_index = sprite_run_behind;
					break;
				default:
					show_debug_message("Unaccounted for movement_movementType: " + string(movement_movementType) + " at player ID: " + string(id));
					break;
			}

		} else if (facingDirection == 1){
			switch(movement_movementType){
				case 0:
					sprite_index = sprite_idle_right;
					break;
				case 1:
					sprite_index = sprite_walk_right;
					break;
				case 2:
					sprite_index = sprite_run_right;
					break;
				default:
					show_debug_message("Unaccounted for movement_movementType: " + string(movement_movementType) + " at player ID: " + string(id));
					break;
			}
		} else if (facingDirection == 2){
			switch(movement_movementType){
				case 0:
					sprite_index = sprite_idle_forward;
					break;
				case 1:
					sprite_index = sprite_walk_forward;
					break;
				case 2:
					sprite_index = sprite_run_forward;
					break;
				default:
					show_debug_message("Unaccounted for movement_movementType: " + string(movement_movementType) + " at player ID: " + string(id));
					break;
			}
		} else if (facingDirection == 3){
			switch(movement_movementType){
				case 0:
					sprite_index = sprite_idle_left;
					break;
				case 1:
					sprite_index = sprite_walk_left;
					break;
				case 2:
					sprite_index = sprite_run_left;
					break;
				default:
					show_debug_message("Unaccounted for movement_movementType: " + string(movement_movementType) + " at player ID: " + string(id));
					break;
			}
		}
		//show_debug_message("playerDirection: " + string(facingDirection));
		script_playerInteraction();
		script_playerMenu();
		script_playerChangeCharacter();
		
		if(doRoomTransition)
		{
			state = 40;	
		}
		
		if(doPause)
		{
			state = 30;	
		}
		
		if(doControl == false)
		{
			state = 50;
		}
	
		break;
	case 30:
		// State 30 - Pause Player
		if(doPause == false)
		{
			state = 20;	
		}
		break;
	case 40:
		// State 40 - Do Room Transition
		if(doRoomTransition == false)
		{
			state = 20;	
		}
		break;
	case 50:
		// State 50 - Setup to follow currentPlayerObject
		with(object_GameMaster)
		{
			other.objectToFollow = currentPlayerObject;	
		}
		
		state = 60;
		break;
		case 60:
		// State 60 - Follow controlled character
		// follow objectToFollow
		with(object_GameMaster)
		{
			if(other.objectToFollow != currentPlayerObject)
			{
				other.objectToFollow = currentPlayerObject;	
			}
		}
		script_follow();
		if(doControl)
		{
			// reset move method
			move_towards_point(objectToFollow.x, objectToFollow.y, 0);
			state = 10;
		}
		break;
	default:
		break;
}



if(doUpdateTileset)
{
	show_debug_message("Updating tileset for player character ID: " + string(id));
	doUpdateTileset = false;
	// Reset Tilemap
	collisionLayer = layer_get_id("collision_map");
	collisionTilemap = layer_tilemap_get_id(collisionLayer);
}
if(doReset){
	show_debug_message("Resetting player character ID: " + string(id));
	doReset = false;
	state = 0;
}