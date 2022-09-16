/// @description Insert description here
// You can write your code in this editor

var mx = mouse_x;
var my = mouse_y;
// Snap the mouse cursor to the grid
var mx_snap = floor(mx / 32) * 32;
var my_snap = floor(my / 32) * 32;
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
	
// check to see if quit icon was clicked
if (mx > tile_select_x and mx < tile_select_x + 32 and my > tile_select_y + 21 * 32 and my < tile_select_y + 22 * 32)
{
	room_goto(0);
}

// Check to see if new object was added
if (selected_object != 0 and (mx > 0 and my > 0 and mx < (32 * 38 + 1) and my < (32 * 24)))
{
	// Add object to list!
	// Check: if there is an object at this location already, OR if there is already player object, delete it
	for (j = 0; j < ds_list_size(saved_objects); j +=3;)
	{
		if ((selected_object = 10 and saved_objects[| j] = 10) or (saved_objects[| j + 1] = mx_snap + 16 and saved_objects[| j + 2] = my_snap + 16))
		{
			show_debug_message("DUPLICATE OBJECTS IN THIS SPACE!!!");
			ds_list_delete(saved_objects, j);
			ds_list_delete(saved_objects, j);
			ds_list_delete(saved_objects, j); // delete the object name and x and y coordinates			
		}
	}
	ds_list_add(saved_objects, real(selected_object));
	ds_list_add(saved_objects, mx_snap + 16);
	ds_list_add(saved_objects, my_snap + 16);
	show_debug_message("Object list: " + string (ds_list_size(saved_objects)));
}

// Check to see if the user clicked the blank (erase) tile on top of an object
if (selected_tile = 0 and selected_object = 0)
{
	show_debug_message("Erasing with blank tile...");
	for (j = 0; j < ds_list_size(saved_objects); j +=3;)
	{
		if (saved_objects[| j + 1] = mx_snap + 16 and saved_objects[| j + 2] = my_snap + 16 and saved_objects[| j] != 10) // can never erase player
		{
			show_debug_message("ERASING EXISTING OBJECTS IN THIS SPACE!!!");
			ds_list_delete(saved_objects, j);
			ds_list_delete(saved_objects, j);
			ds_list_delete(saved_objects, j); // delete the object name and x and y coordinates			
		}
	}
	
}
