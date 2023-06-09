/// @description Insert description here
// You can write your code in this editor

draw_text(260,10,"Score: " + string(score));
draw_text(10,10,"Lives: "); // + string(lives));
if (lives > 0)
{
	for (j = 1; j <= lives; j++;)
	{
		draw_sprite_ext(spr_player,1,10 + 40 + j * 32, 16, 0.5, 0.5, 0, c_white, 1);
	}
}
draw_text(490,10,"Level: " + string(global.level));
draw_text(620,10, "Levels won: " + string(global.levels_completed));

//var gp_num = gamepad_get_device_count();
//
//for (j = 0; j < gp_num; j++)
//{
//	draw_text(60,60 + 20 * j,"Gamepad " + string(j) +" status: " + string(gamepad_is_connected(j)));
//}

if lives < 0
{
	draw_sprite_ext(spr_game_over,1,200,200,1,1,0,c_white,1);
}