// Change Character mechanics for all characters
// Change Character visuals will be personalized by character scripts


switch(changeCharacterState)
{
	case 0:
	// playerMenuState 0 - Wait for Button Press
		// Increase Index and change character
		if(keyboard_check(vk_f1) || gamepad_button_check(0,gp_shoulderr))
		{
			with(object_GameMaster)
			{
				if(character_selectedCharacterIndex < character_lastSelectibleCharacterIndex)
				{
					character_selectedCharacterIndex += 1;	
				}
				else
				{
					character_selectedCharacterIndex = 0;
				}
				doPlayerCharacterChange = true;
			}
			changeCharacterState = 10;
		}
		// Decrease Index and change character
		if(keyboard_check(vk_f2) || gamepad_button_check(0,gp_shoulderl))
		{
			with(object_GameMaster)
			{
				if(character_selectedCharacterIndex > 0)
				{
					character_selectedCharacterIndex -= 1;	
				}
				else
				{
					character_selectedCharacterIndex = character_lastSelectibleCharacterIndex;
				}
				doPlayerCharacterChange = true;
			}
			changeCharacterState = 10;
		}
		break;
	case 10:
		show_debug_message("Doing Player Change...");
		changeCharacterState = 20;
		break;
	case 20:
		changeCharacterState = 30;
		break;
	case 30:
		changeCharacterTimer = room_speed * 0.1;
		changeCharacterState = 40;
		break;
	case 40:
		if(changeCharacterTimer > 0)
		{
			changeCharacterTimer =- 1;	
		}
		else
		{
			changeCharacterState = 0;
		}

		break;
	default:
		break;
}