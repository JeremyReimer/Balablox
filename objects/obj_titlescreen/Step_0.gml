/// @description Title screen starting object
// You can write your code in this editor

// Start game (just keyboard S for now)

if (keyboard_check(ord("S")))
{
	room_goto_next();
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