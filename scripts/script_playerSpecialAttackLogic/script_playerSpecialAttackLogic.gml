// Special Attack mechanics for all characters
// Attack visuals will be personalized by character scripts

switch(specialAttackState)
{
	case 0:
	// specialAttackState 0 - Wait for Button Press
		if(keyboard_check(vk_lalt) || gamepad_button_check(0,gp_face2))
		{
			specialAttackState = 10;
		}
		break;
	case 10:
		show_debug_message("Doing Special Attack...");
		specialAttackState = 20;
		break;
	case 20:
		specialAttackState = 30;
		break;
	case 30:
		specialAttackTimer = room_speed * 0.1;
		specialAttackState = 40;
		break;
	case 40:
		if(specialAttackTimer > 0)
		{
			specialAttackTimer -= 1;
		}
		else
		{
			specialAttackState = 0;
		}

		break;
	default:
		break;
}