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
				state = 70;
		break;
	case 70:
		// State 7 - New Game Setup - Enter Something Else
				state = 80;
		break;
	case 80:
		// State 8 - New Game Setup - Some new game explanations of things
				state = 90;
		break;
	case 90:
		// State 9 - New Game Setup - wrapping up new game setup
				state = 100;
		break;
	case 100:
		// State 100 - Begin Level Load
				room_goto(1);
		break;
	default:
	break;
}