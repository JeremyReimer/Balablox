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

	event_user(0); // call Player Death event
}
// 2. death by hitting enemy
var enemyhit = instance_place(x,y,obj_enemy);
if enemyhit and (not player_invulnerable)
{
	event_user(0); // call Player Death event
}
//  3. death by hitting fireball
var fireballhit = instance_place(x,y,obj_nastie_fireball);
if fireballhit and (not player_invulnerable)
{
	event_user(0); // call Player Death event
	with (fireballhit) instance_destroy();
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

// check to see if on a zipline tile
temp_lay_id = layer_get_id("Tiles_1");
temp_map_id = layer_tilemap_get_id(temp_lay_id);
temp_map_tile = tilemap_get_at_pixel(temp_map_id,x,y);
show_debug_message("Tilemap: " + string(temp_map_tile));
// seems like the zipline is Tile 24?

if player_invulnerable
{
	if (random(1) > 0.5)
	{
		sprite_index = spr_player_invisible;
	}
	else
	{
		sprite_index = spr_player;
	}
	if current_time > player_invulnerable_timer
	{
		player_invulnerable = false;
		sprite_index = spr_player;
	}
}



} // end gameover check
else // game really is over
{
	if mouse_check_button_pressed(mb_left)
	{
		tempx = window_mouse_get_x();
		tempy = window_mouse_get_y();
		show_debug_message("x: " + string(tempx) + " y: " + string(tempy));
		if (tempx > 417 and tempx < 618 and tempy > 383 and tempy < 429)
		{
			show_debug_message("START NEW GAME");
			global.gameover = false;
			room_goto(0);
		}
		if (tempx > 871 and tempx < 1007 and tempy > 382 and tempy < 424)
		{
			show_debug_message("QUIT GAME");
			mouse_clear(mb_left);
			game_end();
		}
	}
	// play again button
	// x > 417 x < 618
	// y > 383 y M 429
	// quit button
	// x: 871 y: 424
	// x: 1007 y: 382
}
