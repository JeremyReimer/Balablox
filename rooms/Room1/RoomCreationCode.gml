// display level, levels are 42 x 24 tiles, enemies take up 2 x 2 tiles but can be placed anywhere

var tile_max_x = 42;
var tile_max_y = 24;
var lay_id = layer_get_id("Tiles_1");
var tile_id = layer_tilemap_get_id(lay_id);
show_debug_message(string(working_directory));
var file_name = working_directory + "balablox_room_1.txt";
var current_row_string = "";

var file = file_text_open_write(file_name);

for (j = 0; j < tile_max_y; j++)
{
	for (k = 0; k < tile_max_x; k++)
	{
		var current_tile = tilemap_get(tile_id, k, j);
		current_row_string += string(current_tile);
		if (k < (tile_max_x - 1))
		{
			current_row_string +=  + ", ";
		}
		//show_debug_message(string(current_tile));
	}	
	show_debug_message(current_row_string);
	file_text_write_string(file,current_row_string);
	file_text_writeln(file);
	current_row_string = "";
}

file_text_close(file);