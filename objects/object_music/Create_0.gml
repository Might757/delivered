/// @description Controller for background music!

if (room == room_menu) 
{
		audio_sound_gain(sound_music_boss, 0,2000);
		audio_sound_gain(sound_music_one, 0,2000);
		audio_play_sound(sound_music_title,1000,true);

} 
else if (room != room_menu && room != room_boss)
{
	if (audio_sound_get_gain(sound_music_one) > 0)
	{
		audio_sound_gain(sound_music_title, 0,2000);
	}
	else
	{
		audio_sound_gain(sound_music_title, 0,2000);
		audio_play_sound(sound_music_one,1000,true);
		audio_sound_gain(sound_music_one,0,0);
		audio_sound_gain(sound_music_one,0.05,2000);
	}
}
else if (room == room_boss) 
{
	if (audio_sound_get_gain(sound_music_boss) > 0)
	{
		audio_sound_gain(sound_music_title, 0,2000);
		audio_sound_gain(sound_music_one, 0,2000);
	}
	else
	{
		audio_sound_gain(sound_music_one, 0,2000);
		audio_sound_gain(sound_music_title, 0,2000);
		audio_play_sound(sound_music_boss,1000,true);
		audio_sound_gain(sound_music_boss,0,0);
		audio_sound_gain(sound_music_boss,0.05,2000);
	}
}


