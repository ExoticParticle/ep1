event_inherited();

switch(customState)
{
	case 0:
		// customState 0 - First Frame Init
		customState = 10;
		break;
	case 10:
		// customState 10 - Setup
		// Create robot
		petRobot = instance_create_layer(x,y,"Instances", object_attackRobot1);
		show_debug_message("Trying to instantiate petRobot: object_attackRobot1");
		// Tell the robot to obey me! (I am the other)
		with(petRobot)
		{
			characterToObey = other;	
		}
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
			// Standard basic attack but custom robot special attack
			script_playerBasicAttackLogic();
			// Special case for special attack
			script_playerHomingAttackLogic();
		}

		break;
	default:
		show_debug_message("customState: " + string(customState) + " has fallen outside of handled bounds!");
		break;
}