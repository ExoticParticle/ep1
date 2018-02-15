// Main Monster Run

switch(state)
{
	case 0:
		// State 0 - First Frame Init - either control this character or don't
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
		script_followObject();
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
	doUpdateTileset = false;
	// Reset Tilemap
	collisionLayer = layer_get_id("collision_map");
	collisionTilemap = layer_tilemap_get_id(collisionLayer);
}