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
	if (not instance_place(x,y,obj_dragon)) // dragon is a special case
	{
		instance_destroy(inst);
		audio_play_sound(snd_enemy_dying,10,false);
		instance_destroy();
		score += 200;
	}
	else
	{
		audio_play_sound(snd_enemy_dying,10,false);
		instance_destroy();
		inst.dragon_hit_points -= 1; 
		inst.image_index = 2; // flash red
		if inst.dragon_hit_points <= 0
		{
			instance_destroy(inst);
			// YOU WIN (victory scene goes here)
			global.level = 0; // skipping victory scene goes to main menu
			room_goto_next();
		}
	}
}