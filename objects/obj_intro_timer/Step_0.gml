/// @description Insert description here
// You can write your code in this editor



intro_timer_time = (get_timer() - intro_timer_start) / 1000000;
if intro_timer_time > intro_timer_end
{
	room_goto(global.level);
}

// Can press escape to skip intro

if (keyboard_check(vk_escape))
{
	room_goto(global.level);
}