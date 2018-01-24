switch(changeCharacterState)
{
	case 0:
	// playerMenuState 0 - Wait for Button Press
		if(doPlayerCharacterChange)
		{
			changeCharacterTimer = room_speed * 0.1;
			changeCharacterState = 10;
		}
		break;
	case 10:
		show_debug_message("Doing Player Change...");
		// Turn off previous character
		with(currentPlayerObject)
		{
			doControl = false;
		}
		
		// Turn on newly selected character
		switch(character_selectedCharacterIndex)
		{
			case 0:
			// Select Maxine
			currentPlayerObject = character_playerMaxine;
				break;
			case 1:
			// Select Liam
			currentPlayerObject = character_playerLiam;
				break;
			case 2:
			// Select John
			currentPlayerObject = character_playerJohn;
				break;
			default:
				break;
		}
		
		// Turn on new character
		with(currentPlayerObject)
		{
			doControl = true;	
		}
		changeCharacterState = 20;
		break;
	case 20:
		changeCharacterState = 30;
		break;
	case 30:

		changeCharacterState = 40;
		break;
	case 40:
		if(changeCharacterTimer > 0)
		{
			changeCharacterTimer -= 1;	
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


	

	

