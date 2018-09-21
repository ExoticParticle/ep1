
		movement_x = move_speed * (keyboard_check(vk_right) - keyboard_check(vk_left));
		movement_y = move_speed * (keyboard_check(vk_down) - keyboard_check(vk_up));
		previous_x = 0;
		previous_y = 0;
		if(keyboard_check(vk_lshift)){
			movement_x = movement_x * 2;
			movement_y = movement_y * 2;
		}

		
		if(movement_x == 0)
		{
			movement_x = move_speed * (gamepad_button_check(0,gp_padl) - gamepad_button_check(0,gp_padr));
		}


		if(movement_y == 0)
		{
			movement_y = move_speed * (gamepad_button_check(0,gp_padd) - gamepad_button_check(0,gp_padu));
		}
		if(gamepad_button_check(0,gp_shoulderl)){
			movement_x = movement_x * 2;
			movement_y = movement_y * 2;
		}

		//show_debug_message(movement_y);
		// Determine movement_movementType
		if(movement_x == 0.0 && movement_y == 0.0){
			// No movement, play idle
			movement_movementType = 0;
		} else if (movement_x < -2 || movement_x > 2) {
			// Fast X movement, play run
			movement_movementType = 2;
		} else if (movement_y < -2 || movement_y > 2){
			// Fast Y movement, play run
			movement_movementType = 2;
		} else {
			// Slow movement, play walk
			movement_movementType = 1;
		}
		show_debug_message("movement_x is: " + string(movement_x) + " and movement_y is: " + string(movement_y));
		// Vertical
		previous_y = y;
		y += movement_y;
		if(movement_y > 0)
		{
			// downwards	
			// Chance facing
			facingDirection = 2;
			var t1 = tilemap_get_at_pixel(collisionTilemap,bbox_left,bbox_bottom) & tile_index_mask;
			var t2 = tilemap_get_at_pixel(collisionTilemap,bbox_right,bbox_bottom) & tile_index_mask;

			if(t1 != 0 || t2 != 0)
			{
				y = previous_y;
				// The below is suppose to be "slide along edges" code, but it doesn't work at all.
				//y = ((bbox_bottom & ~63) - 1)  - sprite_bbox_bottom;
				show_debug_message("Player setting Y to: " + string(y));
				movement_y = 0;
			}
		}
		else if(movement_y < 0)
		{ 
			// Upwards
			// Chance facing
			facingDirection = 0;
			var t1 = tilemap_get_at_pixel(collisionTilemap,bbox_left,bbox_top) & tile_index_mask;
			var t2 = tilemap_get_at_pixel(collisionTilemap,bbox_right,bbox_top) & tile_index_mask;

			if(t1 != 0 || t2 != 0)
			{
				y = previous_y;
				// The below is suppose to be "slide along edges" code, but it doesn't work at all.
				//y = ((bbox_top + 64) & ~63)  - sprite_bbox_top;
				show_debug_message("Player setting Y to: " + string(y));
				movement_y = 0;
			}
		}

		// Horizontal
		previous_x = x;
		x += movement_x;
		if(movement_x > 0)
		{
			// right	
			// Chance facing
			facingDirection = 1;
			var t1 = tilemap_get_at_pixel(collisionTilemap,bbox_right,bbox_top) & tile_index_mask;
			var t2 = tilemap_get_at_pixel(collisionTilemap,bbox_right,bbox_bottom) & tile_index_mask;

			if(t1 != 0 || t2 != 0)
			{
				// The below is suppose to be "slide along edges" code, but it doesn't work at all.
				//x = ((bbox_right & ~63) - 1)  - sprite_bbox_right;
				x = previous_x;
				show_debug_message("Player setting X to: " + string(x));
				
				movement_x = 0;
			}
		}
		else if(movement_x < 0)
		{
			// left
			// Chance facing
			facingDirection = 3;
			var t1 = tilemap_get_at_pixel(collisionTilemap,bbox_left,bbox_top) & tile_index_mask;
			var t2 = tilemap_get_at_pixel(collisionTilemap,bbox_left,bbox_bottom) & tile_index_mask;

			if(t1 != 0 || t2 != 0)
			{
				// The below is suppose to be "slide along edges" code, but it doesn't work at all.
				//x = ((bbox_left + 64) & ~63) - sprite_bbox_left;
				x = previous_x;
				show_debug_message("Player setting X to: " + string(x));
				movement_x = 0;
			}
		}
		show_debug_message("Player is at: Y:" + string(y) + " X:" + string(x));