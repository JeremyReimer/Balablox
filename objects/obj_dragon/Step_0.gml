/// @description Insert description here
// You can write your code in this editor

event_inherited();

if (enemy_try_special_move = 1)
{
	image_index = 1;
	dragon_current_roar = current_time + dragon_max_roar;
	if (random(1) < enemy_special_move_chance)
	{
		// do a special move, in this case, create a vortex
		instance_create_layer(x,y,"Instances",obj_vortex);	
	}
	enemy_try_special_move = 0; // wait until the next countdown is 0 (see enemy step code)
}

if current_time > dragon_current_roar
{
	image_index = 0;
}



