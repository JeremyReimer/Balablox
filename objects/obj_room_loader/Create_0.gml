/// @description Insert description here
// You can write your code in this editor


// display level, levels are 42 x 24 tiles, enemies take up 2 x 2 tiles but can be placed anywhere

var level_to_edit = room;
var tile_max_x = 42;
var tile_max_y = 24;
var lay_id = layer_get_id("Tiles_1");
var ladder_id = layer_get_id("Ladders");
var collider_id = layer_get_id("Collision");
var instances_id = layer_get_id("Instances");
var tile_id = layer_tilemap_get_id(lay_id);
show_debug_message(string(working_directory));

// Load the first level (THIS SHOULD BE A FUNCTION OR SOMETHING - maybe an object?)
file_grid = load_csv(working_directory + "bala-room-" + string(level_to_edit) + ".txt");

// Update all the room tiles based on the loaded file (OR MAYBE THIS IS A FUNCTION?)
for (j = 1; j < tile_max_y; j++)
{

	for (k = 1; k < tile_max_x; k++)
	{
		tilemap_set(tile_id, real(file_grid[# k, j]), k, j);
		// If tile is a ladder, create a ladder collider object on the Ladders layer
		var tile = real(file_grid[# k, j]);
		if (tile = 23)
		{
			instance_create_layer(k * 32, j * 32, ladder_id, obj_laddercollider);
		}
		// If the tile is any sort of block, create a collider instance on the Colliders layer
		if (tile = 1 or tile = 4 or tile = 20 or tile = 21)
		{
			instance_create_layer(k * 32, j * 32, collider_id, obj_collider);
		}
	}	
}

// Load all the objects for this level
saved_objects = ds_list_create();
objects_grid = load_csv(working_directory + "bala-objects-" + string(level_to_edit) + ".txt");
for (j=0; j < ds_grid_width(objects_grid); j++;)
{
	//show_debug_message("Loading object: " + string(objects_grid[# j, 0]));
	ds_list_add(saved_objects,  real(objects_grid[# j, 0]));
}

// Populate all the loaded objects into the level
if ds_list_size(saved_objects) > 0
{
	for (j = 0; j < ds_list_size(saved_objects); j += 3;)
	{
		switch (saved_objects[| j])
		{
			case 1:
				instance_create_layer(saved_objects[| j + 1], saved_objects[| j + 2], instances_id, obj_blocker);
			break;
			case 2:
				instance_create_layer(saved_objects[| j + 1], saved_objects[| j + 2], instances_id, obj_breaker);
			break;
			case 3:
				instance_create_layer(saved_objects[| j + 1], saved_objects[| j + 2], instances_id, obj_chaser);
			break;
			case 4:
				instance_create_layer(saved_objects[| j + 1], saved_objects[| j + 2], instances_id, obj_nastie);
			break;
			case 5:
				instance_create_layer(saved_objects[| j + 1], saved_objects[| j + 2], instances_id, obj_spider);
			break;
			case 6:
				instance_create_layer(saved_objects[| j + 1], saved_objects[| j + 2], instances_id, obj_coin);
			break;
			case 7:
				instance_create_layer(saved_objects[| j + 1], saved_objects[| j + 2], instances_id, obj_diamond);
			break;
			case 8:
				instance_create_layer(saved_objects[| j + 1], saved_objects[| j + 2], instances_id, obj_key);
			break;
			case 9:
				instance_create_layer(saved_objects[| j + 1], saved_objects[| j + 2], instances_id, obj_spiderweb);
			break;
			case 10:
				instance_create_layer(saved_objects[| j + 1], saved_objects[| j + 2], instances_id, obj_player);
				global.player_respawn_x = saved_objects[| j + 1]; // global variable to tell player where to respawn
				global.player_respawn_y = saved_objects[| j + 2];
			break;		
		}
	}
}

// Set the mouse cursor to blank
cursor_sprite = -1;
