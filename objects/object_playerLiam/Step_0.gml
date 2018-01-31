event_inherited();

switch(customState)
{
	case 0:
		// customState 0 - First Frame Init
		customState = 10;
		break;
	case 10:
		// customState 10 - Setup
		customState = 20;
		break;
	case 20:
		// customState 20 - Setup
		customState = 30;
		break;
	case 30:
		// customState 30 - Setup
		customState = 40;
		break;
	case 40:
		// customState 40 - Cleanup Setup
		customState = 50;
		break;
	case 50:
		// customState 50 - Run
		if(doControl)
		{
			// Standard attack and special attack
			script_playerBasicAttackLogic();
			script_playerSpecialAttackLogic();
		}

		break;
	default:
		show_debug_message("customState: " + string(customState) + " has fallen outside of handled bounds!");
		break;
}