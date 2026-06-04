/// @description Tocar som da tela de game over
if (room == rm_game_over)
{
	audio_stop_sound(snd_derrota);
	audio_play_sound(snd_derrota, 1, true);
}