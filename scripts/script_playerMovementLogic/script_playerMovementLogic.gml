
		movement_x = move_speed * (keyboard_check(vk_right) - keyboard_check(vk_left));
		movement_y = move_speed * (keyboard_check(vk_down) - keyboard_check(vk_up));
		
		if(movement_x > 0)
		{
			
		}
		else if(movement_x < 0)
		{

		}
		else
		{
			movement_x = move_speed * (gamepad_button_check(0,gp_padl) - gamepad_button_check(0,gp_padr));

		}

		if(movement_y > 0)
		{
			
		}
		else if(movement_y < 0)
		{
			
		}
		else
		{
			movement_y = move_speed * (gamepad_button_check(0,gp_padd) - gamepad_button_check(0,gp_padu));
		}
		

		//show_debug_message(movement_y);
		// Vertical
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
				y = ((bbox_bottom & ~63) - 1)  - sprite_bbox_bottom;
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
				y = ((bbox_top + 64) & ~63)  - sprite_bbox_top;
				movement_y = 0;
			}
		}

		// Horizontal
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
				x = ((bbox_right & ~63) - 1)  - sprite_bbox_right;
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
				x = ((bbox_left + 64) & ~63) - sprite_bbox_left;
				movement_x = 0;
			}
		}