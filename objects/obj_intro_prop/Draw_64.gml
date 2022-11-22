/// @description Insert description here
// You can write your code in this editor

draw_text(90,90,"Intro timer: " + string(obj_intro_timer.intro_timer_time));
if current_move < array_length(move_list)
	{
		draw_text(90,120,"Current move: " + string(move_list[current_move]));
	}
	else
	{
		draw_text(90,120,"Current move: finished");
	}