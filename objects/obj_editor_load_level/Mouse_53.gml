/// @description Insert description here
// You can write your code in this editor

var mx = mouse_x;
var my = mouse_y;
// Snap the mouse cursor to the grid
var mx_snap = floor(mx / 32) * 32;
var my_snap = floor(my / 32) * 32;


// check to see if save icon was clicked
if (mx > tile_select_x and mx < tile_select_x + 32 and my > tile_select_y + 18 * 32 and my < tile_select_y + 19 * 32)
{
	scr_editor_save_level(level_to_edit)
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

// Check to see if the user clicked the left level button (if avail)
if (level_to_edit > 1 and mx > tile_select_x - 32 and mx < tile_select_x  and my > tile_select_y + 16 * 32 and my < tile_select_y + 17 * 32)
{
	show_debug_message("Clicked left level button!");
	scr_editor_load_new_level(level_to_edit - 1);
}

// Check to see if the user clicked the right level button (if avail)
if (level_to_edit < level_max and mx > tile_select_x  and mx < tile_select_x + 32  and my > tile_select_y + 16 * 32 and my < tile_select_y + 17 * 32)
{
	show_debug_message("Clicked right level button!");
	scr_editor_load_new_level(level_to_edit + 1);
}