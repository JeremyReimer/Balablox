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

for (j = 1; j < tile_max_y; j++)
{

	for (k = 1; k < tile_max_x; k++)
	{
		draw_tile(til_balablox1, real(file_grid[# k, j]), 0, k * tile_width, j * tile_height);
		//show_debug_message(string(file_grid[# k, j]));
	}	
}
