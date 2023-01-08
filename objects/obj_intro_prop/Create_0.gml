/// @description Insert description here
// You can write your code in this editor

// set up certain variables

// starting position of object
starting_x = x;
starting_y = y;
intro_gravity = 2; 
char_talking = false;
char_surprising = false;
char_spawning = false;
char_growing = false;
char_hearts = false;
char_roll_credits = false;

credits_list = [
				"Balablox",
				"A game by Jeremy Reimer",
				"Based on 'Balablox' (1987) by Jeremy Reimer",
				"Music: 8-bit Adventure by Steven Melin",
				"Inspired by the short film 'Balablok' (1973)",
				"by Bretislav Pojar",
				"",
				"Thank you for playing!",
				];
				
credits_scroll_counter = 0;
credits_total_scroll = 0;
credits_line_counter = 0;
credits_line_max = array_length(credits_list);
stop_scrolling_credits = false;