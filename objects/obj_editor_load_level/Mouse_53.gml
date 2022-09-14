/// @description Insert description here
// You can write your code in this editor

var mx = mouse_x;
var my = mouse_y;
var tile_max_x = 42;
var tile_max_y = 24;


// check to see if save icon was clicked
if (mx > tile_select_x and mx < tile_select_x + 32 and my > tile_select_y + 18 * 32 and my < tile_select_y + 19 * 32)
{
	show_debug_message("SAVING...");
	// save the currently edited level to a CSV file
	var file_name = working_directory + "bala-room-" + string(level_to_edit) + ".txt";
	var current_row_string = "";

	var file = file_text_open_write(file_name);

	for (j = 0; j < tile_max_y; j++)
	{
		for (k = 0; k < tile_max_x; k++)
		{
			var current_tile = string(file_grid[# k, j]);
			current_row_string += string(current_tile);
			if (k < (tile_max_x - 1))
			{
				current_row_string +=  + ", ";
			}
			//show_debug_message(string(current_tile));
		}	
		show_debug_message(current_row_string);
		file_text_write_string(file,current_row_string);
		file_text_writeln(file);
		current_row_string = "";
	}

	file_text_close(file);
	}
	
// check to see if quit icon was clicked
if (mx > tile_select_x and mx < tile_select_x + 32 and my > tile_select_y + 21 * 32 and my < tile_select_y + 22 * 32)
{
	room_goto(0);
}