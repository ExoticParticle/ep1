// Homing Attack mechanics for all characters
// Attack visuals will be personalized by character scripts

switch(homingAttackState)
{
	case 0:
	// homingAttackState 0 - Wait for Button Press
		if(keyboard_check(vk_lalt) || gamepad_button_check(0,gp_face2))
		{
			homingAttackState = 10;
		}
		break;
	case 10:
		// homingAttackState 10 - Attack 
		show_debug_message("Doing Homing Attack...");
		// Right now our only homing attack is the pet robot so I'm just gonna go ahead and hard code that in right here
		// In the future, this will probably be a controller script for the homing functionality...
		// ...but for now, tell the robot to go!
		with(petRobot)
		{
			doAttack = true;
			switch(other.facingDirection)
			{
			case 0:
				// Up
				other.attackPositionOffsetX = 0;
				other.attackPositionOffsetY = -100 - other.sprite_height;
				break;
			case 1:
				// Right
				other.attackPositionOffsetX = 100 + other.sprite_width;
				other.attackPositionOffsetY = 0;
				break;
			case 2:
				// Down
				other.attackPositionOffsetX = 0;
				other.attackPositionOffsetY = 100 + other.sprite_height;
				break;
			case 3:
				// Left
				other.attackPositionOffsetX = -100 - other.sprite_width;
				other.attackPositionOffsetY = 0;
				break;
			}
			attackPositionX = other.x + other.attackPositionOffsetX;
			attackPositionY = other.y + other.attackPositionOffsetY;
		}
		homingAttackState = 20;
		break;
	case 20:
		// homingAttackState 20 - Attack 
		homingAttackState = 30;
		break;
	case 30:
		// homingAttackState 30 - Attack 
		homingAttackTimer = room_speed * 0.5;
		homingAttackState = 40;
		break;
	case 40:
	// homingAttackState 40 - Attack timeout
		if(homingAttackTimer > 0)
		{
			homingAttackTimer -= 1;
		}
		else
		{
			homingAttackState = 0;
		}

		break;
	default:
		break;
}