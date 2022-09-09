/// @description Insert description here
// You can write your code in this editor

level_to_edit = 1;
audio_stop_all();

// load level from file, levels are 42 x 24 tiles, enemies take up 2 x 2 tiles but can be placed anywhere

file_grid = load_csv(working_directory + "bala-room-" + string(level_to_edit) + ".txt");

// Set the mouse cursor to our custom red arrow
cursor_sprite = spr_mouse_cursor;
window_set_cursor(cr_none);

selected_tile = 0; // the selected tile in the editor, default as blank

// Tiles that we can select and where to place them in the GUI
// This will have to change depending on new tiles we make
available_tiles = [0, 1, 2, 3, 4, 20, 21, 22, 23, 24]
num_tiles_avail = 10; // change to length of array later
tile_select_x = 1280;
tile_select_y = 20;