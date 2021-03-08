/// @description Player Death
// You can write your code in this editor

lives -= 1;
if (lives >= 0)
{
	x = 500; // temporary, fix later
	y = 280;
}
	else
{
	lives = -1;
	global.gameover = 1;
	audio_play_sound(snd_player_lose_game,10,false);
}