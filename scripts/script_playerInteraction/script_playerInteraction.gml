// Interaction mechanics for all characters
// Interaction visuals will be personalized by character scripts


switch(playerInteractionState)
{
	case 0:
		// playerInteractionState 0 - Wait for Button Press
		if(keyboard_check(vk_lcontrol) || gamepad_button_check(0,gp_face3))
		{
			playerInteractionState = 10;
		}
		break;
	case 10:
			show_debug_message("Doing Interaction...");
		playerInteractionState = 20;
		break;
	case 20:
		playerInteractionState = 30;
		break;
	case 30:
		playerInteractionTimer = room_speed * 0.1;
		playerInteractionState = 40;
		break;
	case 40:
		if(playerInteractionTimer > 0)
		{
			playerInteractionTimer -= 1;
		}
		else
		{
			playerInteractionState = 0;
		}

		break;
	default:
		break;
}