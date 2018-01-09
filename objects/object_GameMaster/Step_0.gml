// Game Master Logic
// Top-level logic handler

// State machines increment by 10s so that intermediate states can be easily added later
switch(state)
{
	case 0:
		// State 0 - First Frame Initialization. 
		state = 10;
		break;
	case 10:
		// State 1 - Copyright Screen
				state = 20;
		break;
	case 20:
		// State 2 - Developer Splash
				state = 30;
		break;
	case 30:
		// State 3 - Developer Splash
				state = 40;
		break;
	case 40:
		// State 4 - Something Else
		show_debug_message("GameMaster state 40 complete. Awaiting Main Menu Selection.");
				state = 50;
		break;
	case 50:
		// State 5 - Main Menu
		// Await player selection of top-level menu
		// New Game Goes To 60 for setup
		if(newGameSelected) state = 60;
		// Load Game loads the previously saved game and skips to level load
		if(loadGameSelected) state = 100;
		
		break;
	case 60:
		// State 6 - New Game Setup - Enter Name
		show_debug_message("GameMaster: Enter Name");
				state = 70;
		break;
	case 70:
		// State 7 - New Game Setup - Wait to enter name
		show_debug_message("GameMaster: Name Entered");
				state = 80;
		break;
	case 80:
		// State 8 - New Game Setup - Some new game explanations of things
		show_debug_message("GameMaster: Finishing game explanation");
				state = 90;
		break;
	case 90:
		// State 9 - New Game Setup - wrapping up new game setup
		show_debug_message("GameMaster: Wrapping up new game setup");
				state = 100;
		break;
	case 100:
		// State 100 - Begin Level Load
		show_debug_message("GameMaster: Begin Level Load");
		roomIndexToTransitionTo = 2;

		state = 110;
		room_goto(1);
		break;
	case 110:
		// State 110 - set timer in level load
		loadLevelTimer = room_speed * 2;
		show_debug_message("GameMaster: Set level load timer");
		state = 120;
		break;
	case 120:
		// State 120 - Wait on level load timer
		if(loadLevelTimer <= 0)
		{
			show_debug_message("GameMaster: level load timer finished. Entering state 130.");
			state = 130;	
		}
		else
		{
			loadLevelTimer -= 1;
		}
		break;
	case 130:
		// State 130 - Transition to Room
		show_debug_message("GameMaster: Transitioning to room index:" + string(roomIndexToTransitionTo));
		doRoomLoad = true;
		state = 140;
		break;
	case 140:
		// State 140 - 
		break;
	default:
		show_debug_message("GameMaster has entered unhandled state: " + string(state));
		break;
}

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
		roomLoadState = 30;
		break;
	case 30:
		// RoomLoadState 30 - Transition Room
		show_debug_message("GameMaster: going to room: " + string(roomIndexToTransitionTo));
		room_goto(roomIndexToTransitionTo);
		with(TestPlayerObject)
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
		
		with(TestPlayerObject)
		{

			x = other.playerPositionerX;
			y = other.playerPositionerY;
		}
		show_debug_message("GameMaster: setting player position to index: " + string(playerPositionerIndex) + " (" + string(playerPositionerX) + "," + string(playerPositionerY) + ")");
		roomLoadState = 50;
		break;
	case 50:
		// RoomLoadState 50 - Finish New Room Setup
		roomLoadComplete = true;
		doRoomLoad = false;
		show_debug_message("GameMaster: finishing new room setup and returning to roomLoadState: 0");
		roomLoadState = 0;
		break;
	default:
		show_debug_message("GameMaster has entered unhandled roomLoadState:" + string(roomLoadState));
		break;
}