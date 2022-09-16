/// @description Insert description here
// You can write your code in this editor


// draw tiles

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

// Draw characters and objects availble for selection
draw_sprite_ext(spr_blocker, 0, tile_select_x - 16, tile_select_y + 11 * 32, .5, .5, 0, c_white, 1);
draw_sprite_ext(spr_breaker, 0, tile_select_x - 16, tile_select_y + 12 * 32, .5, .5, 0, c_white, 1);
draw_sprite_ext(spr_chaser, 0, tile_select_x - 16, tile_select_y + 13 * 32, .5, .5, 0, c_white, 1);
draw_sprite_ext(spr_nastie, 0, tile_select_x - 16, tile_select_y + 14 * 32, .5, .5, 0, c_white, 1);
draw_sprite_ext(spr_spider, 0, tile_select_x - 16, tile_select_y + 15 * 32, .5, .5, 0, c_white, 1);
draw_sprite_ext(spr_coin, 0, tile_select_x + 16, tile_select_y + 11 * 32, .5, .5, 0, c_white, 1);
draw_sprite_ext(spr_diamond, 0, tile_select_x + 16, tile_select_y + 12 * 32, .5, .5, 0, c_white, 1);
draw_sprite_ext(spr_key, 0, tile_select_x + 16, tile_select_y + 13 * 32, .5, .5, 0, c_white, 1);
draw_sprite_ext(spr_spiderweb, 0, tile_select_x + 16, tile_select_y + 14 * 32, .5, .5, 0, c_white, 1);
draw_sprite_ext(spr_player, 0, tile_select_x + 16, tile_select_y + 15 * 32, .5, .5, 0, c_white, 1);

// Draw all objects in the object list
if ds_list_size(saved_objects) > 0
{
	for (j = 0; j < ds_list_size(saved_objects); j += 3;)
	{
		switch (saved_objects[| j])
		{
			case 1:
				draw_sprite(spr_blocker, 0, saved_objects[| j + 1], saved_objects[| j + 2]);
			break;
			case 2:
				draw_sprite(spr_breaker, 0, saved_objects[| j + 1], saved_objects[| j + 2]);
			break;
			case 3:
				draw_sprite(spr_chaser, 0, saved_objects[| j + 1], saved_objects[| j + 2]);
			break;
			case 4:
				draw_sprite(spr_nastie, 0, saved_objects[| j + 1], saved_objects[| j + 2]);
			break;
			case 5:
				draw_sprite(spr_spider, 0, saved_objects[| j + 1], saved_objects[| j + 2]);
			break;
			case 6:
				draw_sprite(spr_coin, 0, saved_objects[| j + 1], saved_objects[| j + 2]);
			break;
			case 7:
				draw_sprite(spr_diamond, 0, saved_objects[| j + 1], saved_objects[| j + 2]);
			break;
			case 8:
				draw_sprite(spr_key, 0, saved_objects[| j + 1], saved_objects[| j + 2]);
			break;
			case 9:
				draw_sprite(spr_spiderweb, 0, saved_objects[| j + 1], saved_objects[| j + 2]);
			break;
			case 10:
				draw_sprite(spr_player, 0, saved_objects[| j + 1], saved_objects[| j + 2]);
			break;		
		}
	}
}



// Highlight selected tile (if no object selected)
if selected_object = 0
{
	draw_sprite(spr_tile_select,0, tile_select_x-2, (tile_select_y + selected_tile * 32) - 2);
}
else // if an object IS selected, highlight that
{ 
	draw_sprite(spr_tile_select,0, tile_select_x-32-2 + (objx * 32), ((objy - 10) * 32) - 2);
}

// Highlight tile in main editor layout (if within boundaries)
var mx = mouse_x;
var my = mouse_y;
if (mx > 0 and my > 0 and mx < (31 * 40) and my < (32 * 24))
{
	tile_selected_x = floor(mx / 32);
	tile_selected_y = floor(my / 32);
	draw_sprite(spr_tile_select, 0, tile_selected_x * 32, tile_selected_y * 32);
}

// Draw save icon
draw_sprite(spr_saveicon,0,tile_select_x, tile_select_y + 18 * 32);

// Draw quot icon
draw_sprite(spr_quiticon,0,tile_select_x, tile_select_y + 21 * 32);