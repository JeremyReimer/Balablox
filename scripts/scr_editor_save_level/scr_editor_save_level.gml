// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_editor_save_level(level_to_edit)
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
			current_tile = string_replace_all(current_tile, " ", ""); // remove spaces
			current_row_string += current_tile;
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
	// Now add the long string that contains all the data for objects in a separate file
	var file_name2 = working_directory + "bala-objects-" + string(level_to_edit) + ".txt";
	var file2 = file_text_open_write(file_name2);
	var current_object_string = "";
	for (j = 0; j < ds_list_size(saved_objects); j++)
	{
		current_object_string += string(saved_objects[| j]);
		if (j < (ds_list_size(saved_objects) - 1))
		{
			current_object_string += ", ";
		}
	}
	show_debug_message("Writing object string: " + current_object_string);
	file_text_write_string(file2, current_object_string);
	file_text_close(file2);
}