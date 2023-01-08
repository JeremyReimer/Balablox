/// @description Insert description here
// You can write your code in this editor

// figure out where to draw the debug info vertically based on object
offset_y = 0;
object_name = string(object_get_name(object_index));

switch object_name
{
	case "obj_intro_father":
		offset_y = 20;
		break;
	case "obj_intro_mother":
		offset_y = 40;
		break;
	case "obj_intro_player":
		offset_y = 60;
		break;
	case "obj_intro_sister":
		offset_y = 80;
		break;
	case "obj_intro_dragon":
		offset_y = 100;
		break;
}

if char_roll_credits
{
	//draw_text(90,90,"scroll_counter: " + string(credits_scroll_counter));
	//draw_text(90,120,"line_counter: " + string(credits_line_counter));
	
	for (j=0; j < credits_line_counter; j++)
	{
		draw_text(500,400 - credits_total_scroll + (j * 32),credits_list[j]);
	}
	if (not stop_scrolling_credits)
	{
		credits_scroll_counter += 0.5;
		credits_total_scroll += 0.5;
		if credits_scroll_counter > 32
		{ 
			credits_line_counter += 1;
			credits_scroll_counter = 0;
		}
		if credits_line_counter > credits_line_max
		{ 
			credits_line_counter = credits_line_max
			stop_scrolling_credits = true;
		}
	}
	
}
//draw_text(90,90,"Intro timer: " + string(obj_intro_timer.intro_timer_time));
//draw_text(5, 120 + offset_y,object_name);
//draw_text(155,120 + offset_y,string(current_move));
//if current_move < array_length(move_list)
//	{
//		draw_text(230,120 + offset_y,"Current move: " + string(move_list[current_move]));
//	}
//	else
//	{
//		draw_text(230,120 + offset_y,"Current move: finished");
//	}
