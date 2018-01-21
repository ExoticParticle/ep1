switch(changeCharacterState)
{
	case 0:
	// playerMenuState 0 - Wait for Button Press
		if(doPlayerCharacterChange)
		{

			changeCharacterState = 10;
		}
		
		break;
	case 10:
		show_debug_message("Doing Player Change...");
		with(currentPlayerObject)
		{
			instance_destroy();	
		}
		
		switch(character_selectedCharacterIndex)
		{
			case 0:
				currentPlayerObject = instance_create_layer(playerPositionerX,playerPositionerY,"Instances", object_playerMaxine);
				show_debug_message("Trying to change to character Maxine ");
				break;
			case 1:
				currentPlayerObject = instance_create_layer(playerPositionerX,playerPositionerY,"Instances", object_playerLiam);
				show_debug_message("Trying to change to character Liam ");
				break;
			case 2:
				currentPlayerObject = instance_create_layer(playerPositionerX,playerPositionerY,"Instances", object_playerJohn);
				show_debug_message("Trying to change to character John ");
				break;
			default:
				show_debug_message("Trying to change to unaccounted for index: " + character_selectedCharacterIndex);
				break;
		}
		changeCharacterState = 20;
		break;
	case 20:
		changeCharacterState = 30;
		break;
	case 30:
		changeCharacterTimer = room_speed * 1.0;
		changeCharacterState = 40;
		break;
	case 40:
		if(changeCharacterTimer > 0)
		{
			changeCharacterTimer =- 1;	
		}
		else
		{
			doPlayerCharacterChange = false;
			changeCharacterState = 0;
		}

		break;
	default:
		break;
}


	

	

