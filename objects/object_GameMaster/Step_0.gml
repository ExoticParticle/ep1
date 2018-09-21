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
		loadLevelTimer = room_speed * 1;
		doRoomLoad = true;
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

		// Create Players
		for(i = 0; i < array_length_1d(activePlayerCharacterIndexes); i++)
		{
		switch(i)
		{
			case 0:
				character_playerMaxine = instance_create_layer(playerPositionerX,playerPositionerY,"Instances", object_playerMaxine);
				show_debug_message("Trying to instantiate character Maxine ");
				break;
			case 1:
				character_playerLiam = instance_create_layer(playerPositionerX,playerPositionerY,"Instances", object_playerLiam);
				show_debug_message("Trying to instantiate character Liam ");
				break;
			case 2:
				character_playerJohn = instance_create_layer(playerPositionerX,playerPositionerY,"Instances", object_playerJohn);
				show_debug_message("Trying to instantiate character John ");
				break;
			default:
				show_debug_message("Trying to instantiate unaccounted for index: " + character_selectedCharacterIndex);
				break;
		}
		}
		currentPlayerObject = character_playerMaxine;
		with(currentPlayerObject)
		{
			doControl = true;
		}
		state = 140;
		break;
	case 140:
		// State 140 - Last Steps
		doPlayerCharacterChange = true;

		state = 150;
		break;
	case 150:
		// State 150 - MAIN RUN LOOP
		break;
	default:
		show_debug_message("GameMaster has entered unhandled state: " + string(state));
		break;
}

// Do the room transition logic state machine independently of other logic routines
script_handleRoomTransitions();
// Do the character switching state machine independently of other logic routines
script_switchCharacterVisuals();
script_handleScreenResolution();