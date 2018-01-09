
if(doDrawButtons)
{
	var i = 0;
	repeat (buttons) {
		draw_set_font(font_testFont);
		draw_set_halign(fa_center);
		draw_set_valign(fa_middle);
	
		xx = menu_x;
		yy = menu_y + (button_height + button_padding) * i + 256 * (1 - unfold[i]);
	
		draw_set_color(c_dkgray);
		draw_rectangle(xx - button_width/2,yy - button_height/2,xx + button_width, yy + button_height,false);
	
		if(menu_index == i)
		{
			draw_set_color(c_aqua);
		}
	
		draw_text(xx,yy,button[i]);
		i++;
	}
}
