// display level, levels are 42 x 24 tiles, enemies take up 2 x 2 tiles but can be placed anywhere

var level_to_edit = 1;
var tile_max_x = 42;
var tile_max_y = 24;
var lay_id = layer_get_id("Tiles_1");
var ladder_id = layer_get_id("Ladders");
var collider_id = layer_get_id("Collision");
var tile_id = layer_tilemap_get_id(lay_id);
show_debug_message(string(working_directory));

// Load the first level (THIS SHOULD BE A FUNCTION OR SOMETHING)
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
		if (tile = 1 or tile = 3 or tile = 4 or tile = 20 or tile = 21)
		{
			instance_create_layer(k * 32, j * 32, collider_id, obj_collider);
		}
	}	
}

// Set the mouse cursor to blank
cursor_sprite = -1;
