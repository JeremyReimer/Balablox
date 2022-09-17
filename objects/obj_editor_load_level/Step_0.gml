/// @description Insert description here
// You can write your code in this editor

// Quick exit out of editor with X, will add confirmation dialog later

if keyboard_check_pressed(ord("X"))
{
	room_goto(0);
}

if keyboard_check_pressed(ord("S"))
{
	scr_editor_save_level(level_to_edit);
}

// Check to see if the user clicked the left level button (if avail)
if (level_to_edit > 1 and keyboard_check_pressed(vk_left))
{
	show_debug_message("Clicked left level button!");
	scr_editor_load_new_level(level_to_edit - 1);
}

// Check to see if the user clicked the right level button (if avail)
if (level_to_edit < level_max and keyboard_check_pressed(vk_right))
{
	show_debug_message("Clicked right level button!");
	scr_editor_load_new_level(level_to_edit + 1);
}