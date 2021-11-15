/// @description Insert description here
// You can write your code in this editor

// move fireball
switch (fireball_current_direction)
{
	case 1:
		x += fireball_speed;
		break;
	case 2:
		x -= fireball_speed;
		break;
}	

// check of fireball times out
if (current_time > fireball_current_lifetime)
{
	instance_destroy();
}


// check to see if fireball is out of range
if (x < 0)
{
	instance_destroy();
}
if (x > window_get_width())
{
	instance_destroy();
}