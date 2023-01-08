/// @description Insert description here
// You can write your code in this editor

// update movement if still travel time
if (current_time < vortex_current_traveltime)
{
	x += vortex_direction_x;
	y += vortex_direction_y;
}

// check for end of life for vortex
if (current_time > vortex_current_lifetime)
{
	instance_destroy();
}