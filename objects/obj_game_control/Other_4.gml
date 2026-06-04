audio_stop_all();

lay_id = layer_get_id("Background")

if (room == rm_inicio)
{
	back_id = layer_background_get_id(lay_id);
}

if (room == rm_jogo)
{
	audio_stop_sound(snd_trilha_sonora);
	audio_play_sound(snd_trilha_sonora, 1, true);
}	

if (room == rm_game_over)
{
	alarm[0] = 60;
}	