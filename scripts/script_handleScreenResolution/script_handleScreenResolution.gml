if(keyboard_check(vk_escape)){
	screenResolutionChangeCounter = get_timer() * 0.001;
	if(screenResolutionChangeTimeout < screenResolutionChangeCounter){
		if(window_get_fullscreen()){
			window_set_fullscreen(false);
		} else {
			window_set_fullscreen(true);
		}
		screenResolutionChangeCounter += room_speed * 30;
		screenResolutionChangeTimeout = screenResolutionChangeCounter;
	}
}