// Change Character mechanics for all characters
// Change Character visuals will be personalized by character scripts
		// Increase Index and change character
		if(keyboard_check(vk_f1) || gamepad_button_check(0,gp_shoulderr))
		{
			// Tell GameMaster about the newly selected character index and to doPlayerCharacterChange
			with(object_GameMaster)
			{
				if(changeCharacterTimer <= 0)
				{
					if(character_selectedCharacterIndex < character_lastSelectibleCharacterIndex)
					{
						character_selectedCharacterIndex += 1;	
					}
					else
					{
						character_selectedCharacterIndex = 0;
					}
					playerPositionerX = other.x;
					playerPositionerY = other.y;
					doPlayerCharacterChange = true;
				}
			}
		}
		// Decrease Index and change character
		if(keyboard_check(vk_f2) || gamepad_button_check(0,gp_shoulderl))
		{
			// Tell GameMaster about the newly selected character index and to doPlayerCharacterChange
			with(object_GameMaster)
			{
				if(changeCharacterTimer <= 0)
				{
					if(character_selectedCharacterIndex > 0)
					{
						character_selectedCharacterIndex -= 1;	
					}
					else
					{
						character_selectedCharacterIndex = character_lastSelectibleCharacterIndex;
					}
					playerPositionerX = other.x;
					playerPositionerY = other.y;
					doPlayerCharacterChange = true;
				}
			}
		}