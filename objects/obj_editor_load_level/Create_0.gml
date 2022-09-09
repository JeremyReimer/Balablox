/// @description Insert description here
// You can write your code in this editor

level_to_edit = 1;
audio_stop_all();

// load level from file, levels are 42 x 24 tiles, enemies take up 2 x 2 tiles but can be placed anywhere

file_grid = load_csv(working_directory + "bala-room-" + string(level_to_edit) + ".txt");



