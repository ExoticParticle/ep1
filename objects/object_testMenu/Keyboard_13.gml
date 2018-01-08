

switch(menu_index)
{
	case 0:
		show_debug_message("New Game");
		room_goto(1);
		break;
	case 1:
		show_debug_message("Load Game");
		room_goto(1);
		break;
	case 2:
		show_debug_message("Options");
		break;
	case 3:
		show_debug_message("Exit");
		game_end();
		break;
	default:
		show_debug_message("Unhandled menu_index" + menu_index);
		break;	
}