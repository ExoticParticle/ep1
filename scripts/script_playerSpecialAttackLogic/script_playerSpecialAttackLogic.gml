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
		switch(facingDirection)
		{
			case 0:
			// Up
			attackPositionOffsetX = 0;
			attackPositionOffsetY = -5 - sprite_height;
			break;
			case 1:
			// Right
			attackPositionOffsetX = 5 + sprite_width;
			attackPositionOffsetY = 0;
			break;
			case 2:
			// Down
			attackPositionOffsetX = 0;
			attackPositionOffsetY = 5 + sprite_height;
			break;
			case 3:
			// Left
			attackPositionOffsetX = -5 - sprite_width;
			attackPositionOffsetY = 0;
			break;
		}
		instance_create_layer(x + attackPositionOffsetX, y + attackPositionOffsetY,"Instances", object_playerSpecialAttackEffect);
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