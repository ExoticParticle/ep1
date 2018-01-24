switch(roomLoadState)
{
	case 0:
		// RoomLoadState 0 - Wait to begin room load
		if(doRoomLoad)
		{
			show_debug_message("GameMaster: doing room load to room: " + string(roomIndexToTransitionTo) + " at index: " + string(playerPositionerIndex));
			roomLoadCompleted = false;
			roomLoadState = 10;	
		}
		break;
	case 10:
		// RoomLoadState 10 - Prepare for room load
		show_debug_message("GameMaster: preparing for room load");
		roomLoadState = 20;
		break;
	case 20:
		// RoomLoadState 20 - Unload Current Scene Stuff
		show_debug_message("GameMaster: unloading current scene stuff");
		with(currentPlayerObject)
		{
			doRoomTransition = true;	
		}
		roomLoadState = 30;
		break;
	case 30:
		// RoomLoadState 30 - Transition Room
		show_debug_message("GameMaster: going to room: " + string(roomIndexToTransitionTo));
		room_goto(roomIndexToTransitionTo);
		with(currentPlayerObject)
		{
			doUpdateTileset = true;	
		}
		roomLoadState = 40;
		break;
	case 40:
		// RoomLoadState 40 - Setup New Room, position player
		// Find appropriate player positioner
		//show_debug_message("Player positioner array length: " + string(instance_number(object_playerPositioner)));
		for(playerPositionerLoopIndex = 0; playerPositionerLoopIndex < instance_number(object_playerPositioner); playerPositionerLoopIndex += 1)
		{
			//show_debug_message("GameMaster: doing playerPositionerLoopIndex:  " + string(playerPositionerLoopIndex));
			with(instance_find(object_playerPositioner, playerPositionerLoopIndex))
			{
				show_debug_message("GameMaster: searching for playerPositionerIndex: " + string(other.playerPositionerIndex) + ", playerPositionIndex is: " + string(playerPositionIndex));
				if(other.playerPositionerIndex == playerPositionIndex)
				{
					show_debug_message("GameMaster: setting found playerposition to: " + string(x) + "," + string(y));
					other.playerPositionerX = x;
					other.playerPositionerY = y;
				}
			}
		}

		with(currentPlayerObject)
		{

			x = other.playerPositionerX;
			y = other.playerPositionerY;
		}
		show_debug_message("GameMaster: setting player position to index: " + string(playerPositionerIndex) + " (" + string(playerPositionerX) + "," + string(playerPositionerY) + ")");
		roomLoadState = 50;
		break;
	case 50:
		// RoomLoadState 50 - Finish New Room Setup
		with(currentPlayerObject)
		{
			doRoomTransition = false;	
		}
		roomLoadComplete = true;
		doRoomLoad = false;
		show_debug_message("GameMaster: finishing new room setup and returning to roomLoadState: 0");
		roomLoadState = 0;
		break;
	default:
		show_debug_message("GameMaster has entered unhandled roomLoadState:" + string(roomLoadState));
		break;
}