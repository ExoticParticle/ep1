// Menu mechanics for all characters
// Menu visuals will be personalized by character scripts


switch(playerMenuState)
{
	case 0:
	// playerMenuState 0 - **DISABLED** do nothing...

		break;
	case 10:
			show_debug_message("Doing Menu...");
		playerMenuState = 20;
		break;
	case 20:
		playerMenuState = 30;
		break;
	case 30:
		playerMenuTimer = room_speed * 0.1;
		playerMenuState = 40;
		break;
	case 40:
		if(playerMenuTimer > 0)
		{
			playerMenuTimer -= 1;
		}
		else
		{
			playerMenuState = 0;
		}

		break;
	default:
		break;
}