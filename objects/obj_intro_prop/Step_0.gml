/// @description Insert description here
// You can write your code in this editor


// Here, put all the code to interpret actions at a particular time

// Let's think about the actions needed for the intro
// 1 - Start moving at a direction (1-8 starting at north) at speed
// 2 - Stop moving
// 3 - Jump up (ends after landing)
// 4 - Say dialogue for certain time
// 5 - Show surprise icon
// 6 - New character appears (becomes visible)
// 7 - Character animates to a certain frame
// 8 - Character produces a new object (eg dragon)
// 9 - Character disappears
// 
// In an array, like ((2, 3, 1) (3, 4, 1) (5, 10, 4)) 
// - at two seconds, jump for 1 second
// - at three seconds, say dialogue for one second
// - at five seconds, create a new vortex object (need array to store these)
// 
// Also need a counter for each object so we don't repeat events, 
// if counter over max, do nothing forever
// and a "current move" because some moves need to resolve (eg jump)
//
// All this has to be timed to certain seconds, counted by obj_intro_timer 

// do stuff based on current move

if current_move < array_length(move_list) // if we're out of moves, do nothing
{
	var the_current_time = move_list[current_move, 0];
	var the_current_move = move_list[current_move, 1];
	var the_current_option = move_list[current_move, 2];
	var the_current_speed = move_list[current_move, 3];
	if (obj_intro_timer.intro_timer_time > the_current_time)
	{
		current_move++;
	}
	switch the_current_move
	{
		case 1: // Move in a certain direction
			switch the_current_option
			{
				case 1: // north
					y -= the_current_speed;
					break;
				case 2: // northeast
					y -= the_current_speed;
					x += the_current_speed;
					break;
				case 3: // east
					x += the_current_speed;
					break;
				case 4: // southeast
					x += the_current_speed;
					y += the_current_speed;
					break;
				case 5: // south
					y += the_current_speed;
					break;
				case 6: // southwest
					x -= the_current_speed;
					y += the_current_speed;
					break;
				case 7: // west
					x -= the_current_speed;
					break;
				case 8: // northwest
					x -= the_current_speed;
					y -= the_current_speed;
					break;
				
			}
		
		break;
			
		case 2: // Stop
			break; // it's ridiculously simple to do nothing
			
		break;
	}
}