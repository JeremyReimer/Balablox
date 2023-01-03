/// @description Insert description here
// You can write your code in this editor

event_inherited();

current_move = 0; // let's begin at the beginning
move_list = [[1,1,3,0.5], // at 1 second, start moving right
			 [2,1,3,0],   // at 2 seconds, slow to a stop
			 [3,1,3,0],   // at 3 seconds, slow to a stop
			 [4,1,3,0],   // at 4 seconds, slow to a stop
			 [5,4,0,0],   // at 5 seconds, talk
			 [6,2,0,0],	  // at 6 seconds, do nothing
			 [7,2,0,0],	  // at 7 seconds, do nothing
			 [8,2,0,0],	  // at 8 seconds, do nothing
			 [9,5,0,5],	  // at 9 seconds, surprise with jump
			 [10,2,0,0],  // at 10 seconds, stop
			 [11,2,0,0],  // still stop
			 [12,2,0,0],  // still stop
			 [13,2,0,0],  // still stop
			 [14,10,0,0]  // at 14 seconds, become invisible
			 ];
