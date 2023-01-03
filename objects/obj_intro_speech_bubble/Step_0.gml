/// @description Insert description here
// You can write your code in this editor

// Can press spacebar to skip intro

event_inherited();

// check to see if bubble should expire
if obj_intro_timer.intro_timer_time > creation_time + life_span
{
	instance_destroy();
}