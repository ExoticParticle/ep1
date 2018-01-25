// Menu System
// Persistent

switch(state)
{
	case 0:
		// State 0 - Check for keyboard press
		if(closeMenuTimeout <= 0)
		{
			if(keyboard_check(vk_tab))
			{
				show_debug_message("Creating character menu");
				doDrawButtons = true;
				state = 10;
			}
		}
		else
		{
			if(closeMenuTimeout >= 0)
			{
				closeMenuTimeout -= 1;
			}			
		}
		break;
	case 10:
		// State 10 - Setup tab menu
		
		// Pause Player
		with(object_GameMaster)
		{
			with(currentPlayerObject)
			{
				doPause = true;	
			}

		}
		
		closeMenuTimeout = room_speed * 2;
		state = 20;
		break;
	case 20:
		// State 20 - Wait for Menu Selection
		menu_move = keyboard_check_pressed(vk_down) - keyboard_check_pressed(vk_up);
								
		menu_index += menu_move;

		if(menu_index < 0)
		{
			menu_index = buttons - 1;
		}
		if(menu_index > buttons -1)
		{
			menu_index = 0;
		}

		var i = 0;
		repeat(buttons)
		{
			if(unfold[i] == 1)
			{
				i++;	
			}
	
			if(i < buttons)
			{
				unfold[i] = min(1, unfold[i] + .02);	
			}
	
			if(i + 1 < buttons)
			{
				unfold[i + 1] = min(1, unfold[i + 1] + .005);	
			}
		}

		if(menu_index != last_selected)
		{
			audio_play_sound(sound_testMenuSwitchSound,1,false);
			part_particles_create(particle_effects,menu_x,menu_y + (button_height + button_padding) * menu_index,box_flash, 1);
		}

		last_selected = menu_index;
		
		if(closeMenuTimeout <= 0)
		{
			if(keyboard_check(vk_tab))
			{
			closeMenuTimeout = room_speed * 2;
			show_debug_message("Closing character menu");
			doDrawButtons = false;
			state = 30;
			}
		}
		else
		{
			if(closeMenuTimeout >= 0)
			{
				closeMenuTimeout -= 1;
			}			
		}
		break;
	case 30:
		// State 30 -
		// UnPause Player
		with(object_GameMaster)
		{
			with(currentPlayerObject)
			{
				doPause = false;	
			}

		}
		state = 0;
		break;
	default:
		break;
}