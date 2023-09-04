/// @description Size variables and mode setup

w = display_get_gui_width();
h = display_get_gui_height();
h_half = h * 0.5;
enum TRANS_MODE // turning set of ordered numbers to readable code
{
	OFF, // 0
	NEXT, // 1
	GOTO, // 2
	RESTART, // 3
	INTRO // 4
}

mode = TRANS_MODE.INTRO;
percent = 1; // for black screen. 1 means full black screen, 0 means no black screen
target = room;
