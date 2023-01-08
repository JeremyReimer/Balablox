/// @description Title screen starting object
// You can write your code in this editor

// Start game (just keyboard S for now)

if (keyboard_check(ord("S")))
{
	global.level = select_level_num;
	room_goto(RoomIntro);
}


// Quit game from title screen

if (keyboard_check(ord("Q")))
{
	game_end();
}

// Enter level editor

if (keyboard_check(ord("E")))
{
	room_goto(RoomEditor);
}

if (keyboard_check(ord("C")))
{
	select_level = true;
	select_level_num = 1;
}

if (keyboard_check(ord("O")))
{
	room_goto(RoomOptions);
}

if (keyboard_check_pressed(vk_up) and select_level)
{
	select_level_num += 1;
	if select_level_num > select_level_max
	{
		select_level_num = 1;
	}
}

if (keyboard_check_pressed(vk_down) and select_level)
{
	select_level_num -= 1;
	if select_level_num < 1
	{
		select_level_num = select_level_max;
	}
}
