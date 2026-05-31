// Ao colidir com o obj_coletavel, ele deve sumir

with (other)
{
	audio_stop_sound(snd_coletavel)
	audio_play_sound(snd_coletavel, 1, false)
	instance_destroy();	
}