/// @description Insert description here
// You can write your code in this editor

var mx = mouse_x;
var my = mouse_y;

// check to see if within bounds of tile selection area
if (mx > tile_select_x and my > tile_select_y and mx < (tile_select_x + 32) and my < (tile_select_y + (32 * num_tiles_avail)))
{
	//show_debug_message("Mouse clicked at x: " + string(mouse_x) + " y: " +string(mouse_y));
	selected_tile = floor((my - tile_select_y)/32);
	selected_object = 0; // if you've clicked a tile you're no longer selecting an object
}

// check to see if within the bounds of object selection area, if so, select object
if (mx > tile_select_x - 32 and my > (tile_select_y + 10 * 32 + 16) and mx < (tile_select_x + 32) and my < (tile_select_y + 15 * 32 + 16))
{
	objx = round((mx - tile_select_x + 16) / 32);
	objy = round((my - tile_select_y + 10 * 32) / 32);
	var objnum = (objx * 5 + objy) - 20;
	selected_object = objnum; // 
	show_debug_message("Mouse clicked in object selection area!! objx=" + string(objx) + " objy=" + string(objy) + " Objnum=" + string(objnum));
}

// check if in bounds of editing area, and if so, update the tile array (grid thingy)
// it's goddamn magic
if (selected_object = 0 and (mx > 0 and my > 0 and mx < (32 * 38 + 1) and my < (32 * 24)))
{
	file_grid[# tile_selected_x, tile_selected_y] = available_tiles[selected_tile];
}
/// NOTE! Adding objects is in the Left Pressed function, since we don't want to add multiple objects per click

