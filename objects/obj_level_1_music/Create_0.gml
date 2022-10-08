/// @description Insert description here
// You can write your code in this editor

// but is it the final boss level?
if global.level = 16
{
	audio_stop_all();
	audio_play_sound(snd_final_boss_music,9,true);
}
else
{
	if (not audio_is_playing(snd_level_1_music))
	{
	
		audio_stop_all();
		audio_play_sound(snd_level_1_music,9,true);
	
	}
}

