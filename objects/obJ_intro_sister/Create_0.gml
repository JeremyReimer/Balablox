/// @description Insert description here
// You can write your code in this editor

event_inherited();

current_move = 0; // let's begin at the beginning
move_list = [[1,1,3,1], // at 1 second, start moving right at speed 1
			 [2,1,7,1], // at 2 seconds, start moving left
			 [3,1,3,1], // at 3 seconds, right
			 [4,1,7,1], // at 4 seconds, left
			 [5,2,0,0], // at 5 seconds, stop
			 [6,2,0,0], // at 6 seconds, stop
			 [7,2,0,0], // at 7 seconds, stop
			 [8,2,0,0], // at 8 seconds, stop
			 [9,5,0,5],	  // at 9 seconds, surprise with jump
			 [10,2,0,0],  // at 10 seconds, stop
			 [11,2,0,0],  // still stop
			 [12,2,0,0],  // still stop
			 [13,2,0,0],  // still stop
			 [14,10,0,0]  // at 14 seconds, become invisible
			 ];
			
