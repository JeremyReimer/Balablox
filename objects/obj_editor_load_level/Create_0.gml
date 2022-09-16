/// @description Insert description here
// You can write your code in this editor

level_to_edit = 1;
audio_stop_all();

// load level from file, levels are 42 x 24 tiles, enemies take up 2 x 2 tiles but can be placed anywhere
// note that the last line of file_grid is actually one long string of all objects
file_grid = load_csv(working_directory + "bala-room-" + string(level_to_edit) + ".txt");

// Set the mouse cursor to our custom red arrow
cursor_sprite = spr_mouse_cursor;
window_set_cursor(cr_none);

selected_tile = 0; // the selected tile in the editor, default as blank
selected_object = 0; // the selected object, default as none, will override tiles if non-zero

// Tiles that we can select and where to place them in the GUI
// This will have to change depending on new tiles we make
available_tiles = [0, 1, 2, 3, 4, 20, 21, 22, 23, 24];
num_tiles_avail = 10; // change to length of array later
tile_select_x = 1280; // x coordinate to start clicking a selected tile in the editor
tile_select_y = 20;   // y coordinate for same
tile_max_x = 42; // max width of world in tiles
tile_max_y = 24; // max height of world in tiles

// List of objects in the level, in the form of [ objnum1, x, y, ... objnumN, x, y ]
saved_objects = ds_list_create();
objects_grid = load_csv(working_directory + "bala-objects-" + string(level_to_edit) + ".txt");
for (j=0; j < ds_grid_width(objects_grid); j++;)
{
	//show_debug_message("Loading object: " + string(objects_grid[# j, 0]));
	ds_list_add(saved_objects,  real(objects_grid[# j, 0]));
}
