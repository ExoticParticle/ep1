// Basic Attack mechanics for all characters
// Attack visuals will be personalized by character scripts

switch(basicAttackState)
{
	case 0:
		// basicAttackState 0 - Wait for Button Press
		if(keyboard_check(vk_space) || gamepad_button_check(0,gp_face1))
		{
			basicAttackState = 10;
		}
		break;
	case 10:
			show_debug_message("Doing Basic Attack...");
		basicAttackState = 20;
		break;
	case 20:
		basicAttackState = 30;
		break;
	case 30:
		basicAttackTimer = room_speed * 0.1;
		basicAttackState = 40;
		break;
	case 40:
		if(basicAttackTimer > 0)
		{
			basicAttackTimer -= 1;
		}
		else
		{
			basicAttackState = 0;
		}
		break;
	default:
		break;
}