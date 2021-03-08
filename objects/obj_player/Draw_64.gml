/// @description Insert description here
// You can write your code in this editor

draw_text(10,10,"Score: " + string(score));
draw_text(10,30,"Lives: " + string(lives));
draw_text(10,50,"Level: " + string(global.level));

if lives < 0
{
	draw_sprite_ext(spr_game_over,1,200,200,1,1,0,c_white,1);
}