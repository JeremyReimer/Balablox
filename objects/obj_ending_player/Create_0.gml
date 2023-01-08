/// @description Insert description here
// You can write your code in this editor

event_inherited();

current_move = 0; // let's begin at the beginning
move_list = [[1,3,0,5], // at 1 second, jump
			 [2,2,0,0], // at 2 seconds, stop
			 [3,2,0,0], // at 3 seconds, stop
			 [4,2,0,0], // at 4 seconds, stop
			 [5,2,0,0], // at 5 seconds, stop
			 [6,2,0,0], // at 6 seconds, stop
			 [7,2,0,0], // at 7 seconds, stop
			 [8,2,0,0], // at 8 seconds, stop
			 [9,2,0,0],	  // at 9 seconds, stop
			 [10,13,0,0],  // hearts!
			 [11,14,0,0],  // roll credits
			 [12,2,0,0],  // still stop
			 [13,2,0,0],  // still stop
			 [14,2,0,0]  // at 14 seconds, stop
			 ];
			 
// need to adjust the timing for ending

obj_intro_timer.intro_timer_end = 100;