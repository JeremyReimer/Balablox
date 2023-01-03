/// @description Insert description here
// You can write your code in this editor

// Can press spacebar to skip intro

event_inherited();

// Update the x and y variables based on creator movement

getx = variable_instance_get(creator, "x");
gety = variable_instance_get(creator, "y");

x = getx - 32;
y = gety - 72;


// check to see if bubble should expire
if obj_intro_timer.intro_timer_time > creation_time + life_span
{
	instance_destroy();
}