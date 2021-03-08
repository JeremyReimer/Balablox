/// @description Insert description here
// You can write your code in this editor

event_inherited();

if (enemy_try_special_move = 1)
{
	
	if (random(1) > enemy_special_move_chance)
	{
		// do a special move, in this case, delete a tile!
		var tile_to_delete;
		var lay_id = layer_get_id("Tiles_1");
		var map_id = layer_tilemap_get_id(lay_id);
		var mx = tilemap_get_cell_x_at_pixel(map_id,x+32, y+65);
		var my = tilemap_get_cell_y_at_pixel(map_id,x+32, y+65);
		//show_debug_message("Checking tile at: " + string(mx) + ", " + string(my));
		tile_to_delete = tilemap_get(map_id,mx, my);
		tile_to_delete = tile_set_empty(tile_to_delete);
		tilemap_set(map_id,tile_to_delete,mx,my);

	}
	enemy_try_special_move = 0; // wait until the next countdown is 0 (see enemy step code)
}
