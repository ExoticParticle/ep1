// Main Player Run

switch(state)
{
	case 0:
	// State 0 - First Frame Init
	state = 10;
		break;
	case 10:
	// State 10 - Setup Player
	state = 20;
		break;
	case 20:
		// State 20 - Run Player
	
		movement_x = move_speed * (keyboard_check(vk_right) - keyboard_check(vk_left));
		movement_y = move_speed * (keyboard_check(vk_down) - keyboard_check(vk_up));

		//show_debug_message(movement_y);
		// Vertical
		y += movement_y;



		if(movement_y > 0)
		{
			// downwards	
			var t1 = tilemap_get_at_pixel(collisionTilemap,bbox_left,bbox_bottom) & tile_index_mask;
			var t2 = tilemap_get_at_pixel(collisionTilemap,bbox_right,bbox_bottom) & tile_index_mask;

			if(t1 != 0 || t2 != 0)
			{
				y = ((bbox_bottom & ~63) - 1)  - sprite_bbox_bottom;
				movement_y = 0;
			}
		}
		else
		{
			// Upwards
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
			var t1 = tilemap_get_at_pixel(collisionTilemap,bbox_right,bbox_top) & tile_index_mask;
			var t2 = tilemap_get_at_pixel(collisionTilemap,bbox_right,bbox_bottom) & tile_index_mask;

			if(t1 != 0 || t2 != 0)
			{
				x = ((bbox_right & ~63) - 1)  - sprite_bbox_right;
				movement_x = 0;
			}
		}
		else
		{
			// left
			var t1 = tilemap_get_at_pixel(collisionTilemap,bbox_left,bbox_top) & tile_index_mask;
			var t2 = tilemap_get_at_pixel(collisionTilemap,bbox_left,bbox_bottom) & tile_index_mask;

			if(t1 != 0 || t2 != 0)
			{
				x = ((bbox_left + 64) & ~63) - sprite_bbox_left;
				movement_x = 0;
			}
		}
	
		if(doPause)
		{
			state = 30;	
		}
	
		break;
	case 30:
		// State 30 - Pause Player
		if(doPause == false)
		{
			state = 20;	
		}
		break;
	default:
		break;
}



if(doUpdateTileset)
{
	doUpdateTileset = false;
	// Reset Tilemap
	collisionLayer = layer_get_id("collision_map");
	collisionTilemap = layer_tilemap_get_id(collisionLayer);
}


