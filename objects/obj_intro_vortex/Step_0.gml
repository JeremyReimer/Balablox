/// @description Insert description here
// You can write your code in this editor

// Can press spacebar to skip intro

event_inherited();

// check to see if vortex has reached end of life
if obj_intro_timer.intro_timer_time > creation_time + life_span
{
	image_xscale = 2.0;
	image_yscale = 2.0;
}

if obj_intro_timer.intro_timer_time > creation_time + actual_life_span
{
	instance_destroy();
}