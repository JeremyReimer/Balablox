/// @description Insert description here
// You can write your code in this editor

// move fireball

y -= player_fireball_speed;


// check to see if fireball is out of range
if (y < 0)
{
	instance_destroy();
}

// check to see if fireball destroyed an enemy!
inst = instance_place(x,y,obj_enemy);
if inst
{
	instance_destroy(inst);
	audio_play_sound(snd_enemy_dying,10,false);
	instance_destroy();
}