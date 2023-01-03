/// @description Insert description here
// You can write your code in this editor

event_inherited();

current_move = 0; // let's begin at the beginning
move_list = [[1,2,0,0], // at 1 second, stop
			 [2,0,0,0], // at 2 seconds, still stopping
			 [3,0,0,0], // yup
			 [4,0,0,0], // yup
			 [5,0,0,0], // yup
			 [6,0,0,0], // yup
			 [7,0,0,0], // yup
			 [8,1,7,1], // at 8 seconds start moving left
			 [9,6,0,0], // at 9 seconds, become visible
			 [10,7,0,0], // at 10 seconds, play boss music
			 [10.9,11,1,0], // at 10.9 seconds, change sprite index
			 [11,8,6.1,5], // at 11 seconds, spawn vortex going 6.1
			 [11.05,2,0,0], // at 11.05 seconds, stop
			 [11.1,8,6.3,6.5], // at 11.1 seconds, spawn second vortex going 6.2
			 [11.15,2,0,0], // at 11.15 seconds, stop
			 [12,2,0,0], // stop
			 [13,2,0,0], // stop
			 [14,2,0,0], // stop
			 [15,2,0,0], // stop
			 [16,10,0,0] // become invisible
			 
			 ];

image_speed = 0; // don't animate the dragon