/// @description Insert description here
// You can write your code in this editor

var mx = mouse_x;
var my = mouse_y;

// check to see if within bounds of tile selection area
if (mx > tile_select_x and my > tile_select_y and mx < (tile_select_x + 32) and my < (tile_select_y + (32 * num_tiles_avail)))
{
	//show_debug_message("Mouse clicked at x: " + string(mouse_x) + " y: " +string(mouse_y));
	selected_tile = floor((my - tile_select_y)/32);
}

// check if in bounds of editing area, and if so, update the tile array (grid thingy)
// it's goddamn magic
if (mx > 0 and my > 0 and mx < (32 * 38 + 1) and my < (32 * 24))
{
	file_grid[# tile_selected_x, tile_selected_y] = available_tiles[selected_tile];
}

