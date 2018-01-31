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
		show_debug_message("Doing Basic Attack facing direction: " + string(facingDirection));
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
		instance_create_layer(x + attackPositionOffsetX, y + attackPositionOffsetY,"Instances", object_playerBasicAttackEffect);
		basicAttackState = 20;
		break;
	case 20:
		basicAttackState = 30;
		break;
	case 30:
		basicAttackTimer = room_speed * 0.3;
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