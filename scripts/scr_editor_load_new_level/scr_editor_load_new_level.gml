// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_editor_load_new_level(level_to_load)
{
	
	level_to_edit = level_to_load; // load a new level
	
	//load level from file, levels are 42 x 24 tiles, enemies take up 2 x 2 tiles but can be placed anywhere
	// note that the last line of file_grid is actually one long string of all objects
	file_grid = load_csv(working_directory + "bala-room-" + string(level_to_edit) + ".txt");

	selected_tile = 0; // the selected tile in the editor, default as blank
	selected_object = 0; // the selected object, default as none, will override tiles if non-zero

	// List of objects in the level, in the form of [ objnum1, x, y, ... objnumN, x, y ]
	ds_list_clear(saved_objects); // erase existing object list
	objects_grid = load_csv(working_directory + "bala-objects-" + string(level_to_edit) + ".txt");
	for (j=0; j < ds_grid_width(objects_grid); j++;)
	{
		//show_debug_message("Loading object: " + string(objects_grid[# j, 0]));
		ds_list_add(saved_objects,  real(objects_grid[# j, 0]));
	}
}