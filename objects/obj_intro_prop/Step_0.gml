/// @description Insert description here
// You can write your code in this editor


// Here, put all the code to interpret actions at a particular time

// Let's think about the actions needed for the intro
// 1 - Start moving at a direction (1-8 starting at north) at speed
// 2 - Stop moving
// 3 - Jump up (ends after landing)
// 4 - Say dialogue for certain time
// 5 - Show surprise icon
// 6 - Character becomes visible
// 7 - Character animates to a certain frame
// 8 - Character produces a new object (eg dragon)
// 9 - Character doubles in size
// 10 - Character disappears
// 11 - Character changes sprite index
// 12 - Character rotates and vanishes
// 13 - Show heart icon
// 
// In an array, like ((2, 3, 1, 0) (3, 4, 1, 0) (5, 10, 4, 0)) 
// - at two seconds, jump for 1 second
// - at three seconds, say dialogue for one second
// - at five seconds, create a new vortex object (need array to store these)
// 
// Also need a counter for each object so we don't repeat events, 
// if counter over max, do nothing forever (will need to do an end scene thingy)
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
					image_xscale = 1;
					break;
				case 2: // northeast
					y -= the_current_speed;
					x += the_current_speed;
					image_xscale = 1;
					break;
				case 3: // east
					x += the_current_speed;
					image_xscale = 1;
					break;
				case 4: // southeast
					x += the_current_speed;
					y += the_current_speed;
					image_xscale = 1;
					break;
				case 5: // south
					y += the_current_speed;
					image_xscale = 1;
					break;
				case 6: // southwest
					x -= the_current_speed;
					y += the_current_speed;
					image_xscale = -1;
					break;
				case 6.1: // special southwest
					x -= the_current_speed - 0.5;
					y += the_current_speed;
					image_xscale = -1;
					break;
				case 6.2: // special southwest
					x -= the_current_speed - 1.5;
					y += the_current_speed;
					image_xscale = -1;
					break;
				case 6.3: // special southwest
					x -= the_current_speed - 4.9;
					y += the_current_speed;
					image_xscale = -1;
					break;
				case 7: // west
					x -= the_current_speed;
					image_xscale = -1;
					break;
				case 8: // northwest
					x -= the_current_speed;
					y -= the_current_speed;
					image_xscale = -1;
					break;
				
			}
		
		break;
			
		case 2: // Stop
			char_talking = false; // reset talking
			char_surprising = false; // reset surprise icon
			char_spawning = false; // reset spawning icon
			break; // other than that, do nothing
		
		case 3: // Jump
			y -= the_current_speed;
			y += intro_gravity; 
			intro_gravity += 0.1;
			if y > starting_y
			{
				y -= intro_gravity;
			}
			break;
			
		case 4: // Say dialogue
			if (not char_talking)
			{
				char_talking = true;
				instance_create_layer(x-32,y-96,"Instances",obj_intro_speech_bubble);
				if the_current_option == 1
				{
					audio_play_sound(snd_speech_1,10,false);
				}
				if the_current_option == 2
				{
					audio_play_sound(snd_speech_2,10,false);
				}
			}
			break;
			
		case 5: // Show surprise icon
			if (not char_surprising)
			{
				char_surprising = true;
				image_xscale = 1; // turn to the right, for this movie only really
				instance_create_layer(x-32,y-72,"Instances",obj_intro_surprise,
				{
					creator: id // add variable for the instance of the object that created the surprise
				}
				);
			}
			y -= the_current_speed; // optionally jump as well, if speed is set
			y += intro_gravity; 
			intro_gravity += 0.1;
			if y > starting_y
			{
				y -= intro_gravity;
			}
			break;
			
		case 6: // Become visible
			visible = true;
			break;
			
		case 7: // switch music (just one switch right now)
			audio_stop_all();
			audio_play_sound(snd_final_boss_music,10,false);
			break;
			
		case 8: // spawn vortex
			if (not char_spawning) 
			{
				instance_create_layer(x-172,y-102, "Instances", obj_intro_vortex,
				{
					vortex_direction: the_current_option,
					vortex_speed: the_current_speed
				}
				);
			char_spawning = true;
			}
			break;
		
		case 9: // double in size
			if (not char_growing)
			{
				image_xscale = 2.0;
				image_yscale = 2.0;
				char_growing = true;
			}
			break;
			
		case 10: // become invisible
			visible = false;
			break;
			
		case 11: // change sprite index
			image_index = the_current_option;
			break;
			
		case 12: // rotate and vanish
			image_xscale = image_xscale * .9;
			image_yscale = image_yscale * .9;
			image_angle += 5;
			break;
			
		case 13: // show hearts icon
			if (not char_hearts)
			{
				char_hearts = true;
				instance_create_layer(x-32,y-72,"Instances",obj_ending_heart,
				{
					creator: id // add variable for the instance of the object that created the surprise
				}
				);
			}
			break;
			
		case 14: // roll credits
			char_roll_credits = true;
			break;
			
	}
}