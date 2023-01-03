/// @description Insert description here
// You can write your code in this editor

event_inherited();

current_move = 0; // let's begin at the beginning
move_list = [[11,1,vortex_direction,vortex_speed], // at 14 second, start moving (will adjust direction)
			 [11.1,1,vortex_direction,vortex_speed],
			 [11.2,1,vortex_direction,vortex_speed],
			 [12,1,vortex_direction,vortex_speed],
			 [13,2,0,0]

			];

creation_time = obj_intro_timer.intro_timer_time; // the time in seconds after the start of the cutscene when the bubble occurred
life_span = 1.0; // in seconds
actual_life_span = 3.0; // in seconds