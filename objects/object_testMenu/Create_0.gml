
menu_x = x;
menu_y = y;
button_height = 30;
button_width = 256;
button_padding = 20;

// buttons
button[0] = "New Game";
button[1] = "Load Game";
button[2] = "Options";
button[3] = "Exit";
buttons = array_length_1d(button);

menu_index = 0;
last_selected = 0;

var i = 0;
repeat(buttons)
{
	unfold[i] = 0;
	i++;
}

particle_effects = part_system_create();
part_system_depth(particle_effects, -1000);

box_flash = part_type_create();
part_type_shape(box_flash, pt_shape_line);
part_type_size(box_flash,5,5,-.02,0);
part_type_color(box_flash,make_color_rgb(128,255,0),make_color_rgb(0,128,255),make_color_rgb(255,0,128));
part_type_alpha3(box_flash, .3,0.5,0);
part_type_blend(box_flash,true);
part_type_life(box_flash,20,20);