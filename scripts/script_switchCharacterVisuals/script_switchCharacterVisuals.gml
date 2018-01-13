
		with(currentPlayerObject)
		{
		instance_destroy();	
		}
	

	
	switch(character_selectedCharacterIndex)
		{
			case 0:
				currentPlayerObject = instance_create_layer(x,y,"Instances",TestPlayerObject);
				show_debug_message("Trying to change to character TestPlayerObject ");
				break;
			default:
				show_debug_message("Trying to change to unaccounted for index: " + character_selectedCharacterIndex);
				break;
		}
		camera_set_view_target(camera_get_default(),currentPlayerObject);