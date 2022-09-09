/// @description Insert description here
// You can write your code in this editor


// draw tiles

var tile_max_x = 42;
var tile_max_y = 24;
var tile_width = 32;
var tile_height = 32;
var lay_id = layer_get_id("Tiles_1");
var map_id = layer_tilemap_get_id(lay_id);
//show_debug_message(string(map_id));

// Draw 42 x 24 grid of tiles for the map itself, based on the CSV file we loaded in the Create event

for (j = 1; j < tile_max_y; j++)
{

	for (k = 1; k < tile_max_x; k++)
	{
		draw_tile(til_balablox1, real(file_grid[# k, j]), 0, k * tile_width, j * tile_height);
		//show_debug_message(string(file_grid[# k, j]));
	}	
}

// Draw tiles available for selection

for (j = 1; j < num_tiles_avail; j++)
{
	draw_tile(til_balablox1, available_tiles[j], 0, tile_select_x, tile_select_y + j * 32);
}

// Highlight selected tile
draw_sprite(spr_tile_select,0, tile_select_x-2, (tile_select_y + selected_tile * 32) - 2);

// Highlight tile in editor (if within boundaries)
var mx = mouse_x;
var my = mouse_y;
if (mx > 0 and my > 0 and mx < (32 * 40) and my < (32 * 24))
{
	tile_selected_x = floor(mx / 32);
	tile_selected_y = floor(my / 32);
	draw_sprite(spr_tile_select, 0, tile_selected_x * 32, tile_selected_y * 32);
}
