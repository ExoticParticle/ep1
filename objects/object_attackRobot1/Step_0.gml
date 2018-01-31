event_inherited();

switch(attackRobotState)
{
	case 0:
		// AttackRobotState 0 - First Frame Setup
		attackRobotState = 10;
		break;
	case 10:
		// AttackRobotState 10 - Setup
		attackRobotState = 20;
		break;
	case 20:
		// AttackRobotState 20 - Setup
		// Set follow object as characterToObey
		objectToFollow = characterToObey;
		attackRobotState = 30;
		break;
	case 30:
		// AttackRobotState 10 - Run
		// Wait for signal to attack
		if(doAttack)
		{
			// Attack triggered, go to state 40.
			attackRobotState = 40;
			if(hasAttackTargetObject)
			{
				// Attack Target Object has been passed along to us. Go to state 50.
				attackRobotState = 50;
			}
		}
		script_followObject();
		
		break;
	case 40:
		// AttackRobotState 40 - Attack Point
		// Attack Point
		show_debug_message("Robot attacking point: " + string(attackPositionX) + "," + string(attackPositionY));
		attackRobotState = 41;
		break;
	case 41:
		// AttackRobotState 41 - Move To Destination
		move_towards_point(attackPositionX,attackPositionY,move_speed);
		if(distance_to_point(attackPositionX,attackPositionY) < 5)
		{
			// Arrived at destination. Set speed to 0
			script_haltMovement();
			attackRobotState = 42;
		}
		break;
	case 42:
		// AttackRobotState 42 - Arrived At Destination. Do Attack.
		attackRobotState = 43;
		break;
	case 43:
		// AttackRobotState 43 - Do Attack
		attackRobotState = 44;
		break;
	case 44:
		// AttackRobotState 44 - Do Attack
		attackRobotState = 45;
	case 45:
		// AttackRobotState 45 - Do Attack
		attackRobotState = 46;
		break;
	case 46:
		// AttackRobotState 46 - Cleanup Attack
		attackRobotState = 47;
	case 47:
		// AttackRobotState 47 - Cleanup Attack
		
		objectToFollow = characterToObey;
		attackRobotState = 48;
		break;
	case 48:
		// AttackRobotState 48 - Cleanup Attack

		attackRobotState = 49;

		break;
	case 49:
		// AttackRobotState 49 - Reset to run state 30

		doAttack = false;
		hasAttackTargetObject = false;
		attackRobotState = 30;
		show_debug_message("Robot returning to idle state: " + string(attackRobotState));
		break;
	case 50:
		// AttackRobotState 50 - Attack Object
		show_debug_message("Robot attacking object" + string(attackTargetObject));
		// Attack Object
		objectToFollow = attackTargetObject;
		attackRobotState = 51;
		break;
	case 51:
		// AttackRobotState 51 - Move To Destination
		script_followObject();
		if(distance_to_object(objectToFollow) < 5)
		{
			// Arrived at destination. Set speed to 0
			script_haltMovement();
			attackRobotState = 52;
		}
		break;
	case 52:
		// AttackRobotState 52 - Arrived At Destination. Do Attack.
		attackRobotState = 53;
		break;
	case 53:
		// AttackRobotState 53 - Do Attack
		attackRobotState = 54;
		break;
	case 54:
		// AttackRobotState 54 - Do Attack
		attackRobotState = 55;
	case 55:
		// AttackRobotState 55 - Do Attack
		attackRobotState = 56;
		break;
	case 56:
		// AttackRobotState 56 - Cleanup Attack
		attackRobotState = 57;
	case 57:
		// AttackRobotState 57 - Cleanup Attack
		
		objectToFollow = characterToObey;
		attackRobotState = 58;
		break;
	case 58:
		// AttackRobotState 58 - Cleanup Attack
		attackRobotState = 59;

		break;
	case 59:
		// AttackRobotState 59 - Reset to run state 30
		doAttack = false;
		hasAttackTargetObject = false;
		attackRobotState = 30;
		show_debug_message("Robot returning to idle state: " + string(attackRobotState));
		break;
	default:
		break;
}