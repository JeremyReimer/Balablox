/// @description Insert description here
// You can write your code in this editor

if (not global.gameover)
{

if (keyboard_check_pressed(ord("A")) or keyboard_check_pressed(vk_left))
{
	if player_direction_x != -1
	{	
		player_direction_x = -1;
		player_direction_y = 0;
		image_xscale = -1;
	}
}

if (keyboard_check_pressed(ord("D")) or keyboard_check_pressed(vk_right))
{
	if player_direction_x != 1
	{
		player_direction_x = 1;
		player_direction_y = 0;
		image_xscale = 1;
	}
}	

if (keyboard_check_pressed(ord("W")) or keyboard_check_pressed(vk_up))
{
	if place_meeting(x,y-player_speed,obj_laddercollider)
	{
		player_direction_y = -1;
	}
	player_direction_x = 0;
}

if (keyboard_check_pressed(ord("S")) or keyboard_check_pressed(vk_down))
{
	if place_meeting(x,y+player_speed,obj_laddercollider)
	{
		player_direction_y = 1;
	}
	player_direction_x = 0;
}


// Collision check for movement

if ((not (player_direction_x == 0)) and (not player_frozen))
{
	if (not (place_meeting(x+player_speed * player_direction_x, y, obj_collider)))
	{	
		x += player_speed * player_direction_x;
	}
}


if (not (player_direction_y == 0))
{
	if (not (place_meeting(x, y+player_speed * player_direction_y, obj_collider)))
	{	
		y += player_speed * player_direction_y;
	}
	// special ladder check for vertical movement
	// still some weird ladder behavior when at top, fix this later
	if (not (place_meeting(x, y, obj_laddercollider)))
	{	
		player_direction_y = 0;
	}
	
}

// Jump!

if keyboard_check_pressed(vk_space)
{
	player_jumping = true;
}

if player_jumping
{
	y -= player_jump_speed;
}

// gravity check, falling with collision check, also no gravity if on ladder!
// also increase gravity (silly acceleration, bad physics!) each step.
if (not player_frozen) and (not place_meeting(x,y+player_gravity, obj_collider)) and (not (place_meeting(x, y+player_speed * player_direction_x, obj_laddercollider)))
{
	y += player_gravity;
	player_gravity += 0.1;
}
else
{
	player_gravity = player_absolute_gravity;
	player_jumping = false;
}

// coin check-- have you collected a coin?
var inst = instance_place(x,y,obj_coin);
if inst
{
	instance_destroy(inst);
	score += 10;
	audio_play_sound(snd_coin_collect,10,false);
}

// end of level check -- did you get to the key?
var keyend = instance_place(x,y,obj_key);
if keyend
{
	instance_destroy(keyend);
	audio_play_sound(snd_level_clear,10,false);
	global.level += 1;
	room_goto_next();
}

// death check -- did you die?
// 1. death by falling
if y > 850
{
	audio_play_sound(snd_waaa,10,false);
	event_user(0); // call Player Death event
}
var enemyhit = instance_place(x,y,obj_enemy);
if enemyhit
{
	audio_play_sound(snd_aah,10,false);
	event_user(0); // call Player Death event
}

// spiderweb check -- did you get hit by a spiderweb?
var spiderwebhit = instance_place(x,y,obj_spiderweb);
if (spiderwebhit and (not spiderwebhit.var_spiderweb_broken))
{
	if (not spiderwebhit.var_spiderweb_grabbing)
	{
		// first move the player to center of the spiderweb
		x = spiderwebhit.x;
		y = spiderwebhit.y;
		// -- TODO
		// then set a countdown timer for being allowed to move again
		player_frozen = true;
		spiderwebhit.var_spiderweb_frozen_time = current_time + spiderwebhit.var_spiderweb_frozen_time_max;
		spiderwebhit.var_spiderweb_grabbing = true;
		show_debug_message(string(spiderwebhit.var_spiderweb_frozen_time));
	}
	else
	{
		if (current_time > spiderwebhit.var_spiderweb_frozen_time)
		{
			show_debug_message("GRABBING FINISHED");
			spiderwebhit.var_spiderweb_broken = true;
			spiderwebhit.sprite_index = spr_spiderweb_broken;
			player_frozen = false;
		}
	}
	
}


} // end gameover check
