/// @description Player Death
// You can write your code in this editor

audio_play_sound(snd_waaa,10,false);
lives -= 1;
if (lives >= 0)
{
	x = 600; // temporary, fix later
	y = 480;
	// make player invulnerable
	player_direction_x = 0; // stop moving left or right
	player_invulnerable = true;
	player_invulnerable_timer = current_time + player_invulnerable_timer_max;
	
}
	else
{
	lives = -1;
	global.gameover = 1;
	audio_play_sound(snd_player_lose_game,10,false);
}