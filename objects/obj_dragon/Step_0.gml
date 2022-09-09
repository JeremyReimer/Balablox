/// @description Insert description here
// You can write your code in this editor

event_inherited();

if (enemy_try_special_move = 1)
{
	
	if (random(1) < enemy_special_move_chance)
	{
		// do a special move, in this case, create a fireball
		instance_create_layer(x,y,"Instances",obj_nastie_fireball);	
	}
	enemy_try_special_move = 0; // wait until the next countdown is 0 (see enemy step code)
}

