// Se tocar na clt, você PERDE
audio_stop_all();
global.tempo_sem_clt_max = global.tempo_sem_clt;
global.coletados_max = global.coletados;

room_goto(rm_game_over);