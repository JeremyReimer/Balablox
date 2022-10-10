/// @description Options screen starting object
// You can write your code in this editor



// Return to title screen

if (keyboard_check(ord("B")) or keyboard_check(vk_escape))
{
	room_goto(Room0);
}

if keyboard_check(ord("F"))
{
	if window_get_fullscreen()
	{
		window_set_fullscreen(false);
	}
	else
	{
		window_set_fullscreen(true);
	}
}