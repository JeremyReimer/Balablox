/// @description Insert description here
// You can write your code in this editor

/// @description Insert description here
// You can write your code in this editor

// let's just start off with following the player all the time
if (enemy_behavior == 1)
{
	// figure out angle to get to player
	if x < obj_player.x
	{
		// check collisions
		if (not place_meeting(x + enemy_speed, y, obj_collider))
		{
			x += enemy_speed;
			image_xscale = 1;
		}
	}
	if x > obj_player.x
	{
		// check collisions
		if (not place_meeting(x - enemy_speed, y, obj_collider))
		{
			x -= enemy_speed;
			image_xscale = -1;
		}
	}
	if y < obj_player.y
	{
		// check collisions
		if (not place_meeting(x, y + enemy_speed, obj_collider))
		{
			y += enemy_speed;
		}
	}
	if y > obj_player.y
	{
		// check collisions
		if (not place_meeting(x, y - enemy_speed, obj_collider))	
		{
			y -= enemy_speed;
		}
	}
	enemy_countdown -= 1;
	
}
if enemy_countdown <= 0
{
	enemy_countdown = irandom_range(enemy_countdown_min, enemy_countdown_max);
	// change behavior based on random trigger
	if (random(1) > enemy_random)
	{
		enemy_behavior = 1;
	}
	else
	{
		enemy_behavior = 2;
	}
	// if we picked a random behavior, now pick a random direction to go with it
	if enemy_behavior == 2
	{
		enemy_random_direction = irandom_range(1,4);
	}
	enemy_try_special_move = 1; // try a special move, see each enemy's step function for code
}

// Moving in a random direction
if (enemy_behavior == 2)
{
	switch (enemy_random_direction)
	{
	case 1:
		// check collisions
		if (not place_meeting(x + enemy_speed, y, obj_collider))
		{
			x += enemy_speed;
			image_xscale = +1;
		}
		break;
	case 2:
		// check collisions
		if (not place_meeting(x - enemy_speed, y, obj_collider))
		{
			x -= enemy_speed;
			image_xscale = -1;
		}
		break;
	case 3:
		// check collisions
		if (not place_meeting(x, y + enemy_speed, obj_collider))
		{
			y += enemy_speed;
		}
		break;
	case 4:
		// check collisions
		if (not place_meeting(x, y - enemy_speed, obj_collider))	
		{
			y -= enemy_speed;
		}
		break;
	}
	enemy_countdown -= 1;
}

