/// @description Control Menu

//Item ease in transition

menu_x += (menu_x_target - menu_x) / menu_speed;

//Keyboard Controls
if (menu_control) 
{
	if(keyboard_check_pressed(vk_up)) 
	{
		menu_cursor++;
		if (menu_cursor >= menu_items) menu_cursor = 0;
	}
		if(keyboard_check_pressed(vk_down)) 
	{
		menu_cursor--;
		if (menu_cursor < 0) menu_cursor = menu_items -1;
	}
	
		if(keyboard_check_pressed(vk_enter)) 
	{
		menu_x_target = gui_width + 200;
		menu_committed = menu_cursor;
		script_screenShake(4, 30);
		menu_control = false;
		audio_play_sound(sound_menu,1,false);
	}
}

if (menu_x > gui_width + 150) && (menu_committed != -1)
{
	switch (menu_committed) 
	{
		case 2: default: script_slideTrans(TRANS_MODE.NEXT); break;
		
		case 1: 
		{
			if (!file_exists(SAVEFILE)) 
			{
				script_slideTrans(TRANS_MODE.NEXT);
			} 
			else
			{
				var file = file_text_open_read(SAVEFILE);
				var target = file_text_read_real(file);
				file_text_close(file)
				script_slideTrans(TRANS_MODE.GOTO, target);
			}
			break;
		}
		case 0: game_end(); break;
	
	}
}