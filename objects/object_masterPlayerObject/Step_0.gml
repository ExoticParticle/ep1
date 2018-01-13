// Main Player Run

switch(state)
{
	case 0:
	// State 0 - First Frame Init
	state = 10;
		break;
	case 10:
	// State 10 - Setup Player
	state = 20;
		break;
	case 20:
		// State 20 - Run Player
		script_playerMovementLogic();
		script_playerBasicAttackLogic();
		script_playerSpecialAttackLogic();
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
			state = 30;	
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
