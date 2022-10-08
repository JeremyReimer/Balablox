/// @description Insert description here
// You can write your code in this editor

if (not audio_is_playing(snd_level_1_music))
{
	audio_stop_all();
	audio_play_sound(snd_level_1_music,9,true);
}