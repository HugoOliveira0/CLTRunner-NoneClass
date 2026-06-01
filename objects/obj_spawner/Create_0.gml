// Variáveis para saber se é esquerda ou direita;
lado_esq = 20;
lado_dir = room_width - 20;

tempo = random_range(1, 3)

alarm[0] = (game_get_speed(gamespeed_fps) * tempo) / global.vel;
alarm[1] = (game_get_speed(gamespeed_fps) * tempo) / global.vel;