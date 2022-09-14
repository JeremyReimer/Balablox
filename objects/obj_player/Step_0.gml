/// @description Insert description here
// You can write your code in this editor

if (not global.gameover)
{

// TEMPORARY QUIT COMMAND TO GO TO MAIN MENU
if (keyboard_check(ord("X")))
{
	room_goto(asset_get_index("Room0"));
}

if player_accelerating
{
	player_speed += player_acceleration_rate;
	if player_speed > player_speed_max
	{
		player_speed = player_speed_max
	}
}

if (keyboard_check(ord("A")) or keyboard_check(vk_left))
{
		if player_direction_x == 1
		{
			player_speed = 0;
		}
		player_direction_x = -1;
		player_direction_y = 0;
		image_xscale = -1;	
		if (not player_accelerating)
		{
			player_accelerating = true;
			player_decelerating = false;
		}
}
else if (keyboard_check(ord("D")) or keyboard_check(vk_right))
{
		if player_direction_x == -1
		{
			player_speed = 0;
		}
		player_direction_x = 1;
		player_direction_y = 0;
		image_xscale = 1;
		if (not player_accelerating)
		{
			player_accelerating = true;
			player_decelerating = false;
		}
}
else
{
	player_accelerating = false;
	player_decelerating = true;
}

if player_decelerating
{
	player_speed -= player_deceleration_rate;
	if player_speed < 0
	{
		player_direction_x = 0;
		player_direction_y = 0;
		player_speed = 0
	}
}

if (keyboard_check(ord("W")) or keyboard_check(vk_up))
{
	if place_meeting(x,y-player_speed,obj_laddercollider)
	{
		player_direction_y = -1;
	}
	player_direction_x = 0;

}
else if (keyboard_check(ord("S")) or keyboard_check(vk_down))
{
	if place_meeting(x,y+player_speed,obj_laddercollider)
	{
		player_direction_y = 1;
	}
	player_direction_x = 0;

	if player_hanging // can break player hanging with down key
	{
		player_hanging = false;
	}
}
else
{
	player_direction_y = 0;

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
		y += player_speed_max * player_direction_y; // no acceleration on ladders
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
	if player_hanging // if you jump while hanging you aren't hanging any more
	{
		player_hanging = false;
	}
}

if player_jumping
{
	if (place_meeting(x,y-player_jump_speed, obj_collider))
	{
		player_jumping = false; // if you hit a ceiling you stop jumping
	}
	if ((not player_frozen) and (not (place_meeting(x,y-player_jump_speed, obj_collider))))
	{
		y -= player_jump_speed;
	}
}

// gravity check, falling with collision check, also no gravity if on ladder, or on zipline
// also increase gravity (silly acceleration, bad physics!) each step.
if (not player_frozen) and (not player_hanging) and (not place_meeting(x,y+player_gravity, obj_collider)) and (not (place_meeting(x, y+player_speed * player_direction_x, obj_laddercollider)))
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

// diamond check-- have you collected a diamond
var inst = instance_place(x,y,obj_diamond);
if inst
{
	instance_destroy(inst);
	score += 100;
	sprite_index = spr_player_powerup;
	player_powerup = true;
	player_powerup_timer = current_time + player_powerup_timer_max; // invulnerable for so long
	audio_play_sound(snd_diamond,10,false);
}

// are you SUPER POWERED???
if player_powerup
{
	if keyboard_check_pressed(vk_enter) // Fire player fireball
	{
		instance_create_layer(x,y,"Instances",obj_player_fireball);	
	}
	if current_time > player_powerup_timer
	{
		player_powerup = false;
		sprite_index = spr_player;
	}
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
// show_debug_message("Tilemap: " + string(temp_map_tile));
// show_debug_message("Vertical y: " + string(y) + " Modulo of vertical: " + string(round(y mod 32)));
// seems like the zipline is Tile 24? But also need to check to see if correct alignment with zip
if (temp_map_tile == 24 and (y mod 32 > 6) and (y mod 32 < 8))
{
		player_hanging = true;
}
else
{
	player_hanging = false;
}

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
