/// @description HUD do Game

	var _largura_gui = display_get_gui_width(); // Pega a largura real da GUI
    var _altura_gui = display_get_gui_height(); // Pega a altura real da GUI

	draw_set_font(fnt_font)
#region Tela de Jogo

if (room == rm_jogo)
{
	
	
	// Quadrado do hud
	draw_set_alpha(0.9);
	draw_set_colour(c_black);
	draw_rectangle(0, _altura_gui - 70, _largura_gui, _altura_gui, false);
	draw_set_colour(c_white);
	draw_set_alpha(1);
	
	// Texto
	draw_set_halign(1);
	draw_text(_largura_gui / 2, _altura_gui - 60, $"Tempo sem CLT: {global.tempo_sem_clt} Segundos");
	draw_set_halign(-1);
	
	// Coletáveis
	draw_set_halign(1);
	draw_text(_largura_gui / 2, _altura_gui - 30, $"Comidas Coletadas: {global.coletados}");
	draw_set_halign(-1);
}

#endregion


#region Tela de Game Over

if (room == rm_game_over)
{
	// QUADRADO PRETO
	draw_set_alpha(0.9);
	draw_set_colour(c_black);
	draw_rectangle(0, 0, _largura_gui, _altura_gui, false);
	draw_set_colour(c_white);
	draw_set_alpha(1);
	
	// SPRITE DA CLT
	var _frame = (current_time / 1000) * 7;
	
	draw_sprite_ext(spr_clt, _frame, _largura_gui / 2, 150, 4, 4, 90, c_white, 1)
	
	// TEXTO DE DERROTA
	draw_set_halign(1);
	draw_text_ext_transformed_colour(_largura_gui / 2, 170, "Voce foi Contratado", 15, 150, 1.95, 1.95, 0, c_gray, c_gray, c_gray, c_gray, 1);
	draw_text_ext_transformed(_largura_gui / 2, 170, "Voce foi Contratado", 15, 150, 2, 2, 0);
	
	// TEXTOS DE RECORDE
	draw_text_ext_transformed_colour(_largura_gui / 2, 300, "Tempo Maximo sem CLT", 15, 170, 1.18, 1.18, 0, c_gray, c_gray, c_gray, c_gray, 1);
	draw_text_ext_transformed(_largura_gui / 2, 300, "Tempo Maximo sem CLT", 15, 170, 1.2, 1.2, 0);
	draw_text_ext_transformed_colour(_largura_gui / 2, 350, $"{global.tempo_sem_clt_max} Segundos", 15, 150, escala_atual, escala_atual, 0, c_yellow, c_yellow, c_yellow, c_yellow, 1);
	
	draw_text_ext_transformed_colour(_largura_gui / 2, 400, "Refeicoes Feitas", 15, 170, 1.18, 1.18, 0, c_gray, c_gray, c_gray, c_gray, 1);
	draw_text_ext_transformed(_largura_gui / 2, 400, "Refeicoes Feitas", 15, 170, 1.2, 1.2, 0);
	draw_text_ext_transformed_colour(_largura_gui / 2, 450, $"{global.coletados_max} Comidinhas", 15, 150, escala_atual, escala_atual, 0, c_yellow, c_yellow, c_yellow, c_yellow, 1);
	draw_set_halign(-1);
	
	// BOTÃO PRA REINICAR
	var _botao_y = _altura_gui - 100; 
	var _botao_x = _largura_gui / 2;  
	
	// Pega a posição do mouse na tela
	var _mouse_x = device_mouse_x_to_gui(0);
	var _mouse_y = device_mouse_y_to_gui(0);
	
	// Define as bordas do botão
	var _esq = _botao_x - 80;
	var _dir = _botao_x + 100;
	var _cima = _botao_y - 30;
	var _baixo = _botao_y + 40;
	
	// Variável que vai decidir qual frame desenhar (0 = normal, 1 = hover)
	var _img_index = 0; 
	
	// Checa se o mouse está dentro do botão
	if (point_in_rectangle(_mouse_x, _mouse_y, _esq, _cima, _dir, _baixo))
	{
		// Mouse está em cima! Muda para o frame 1
		_img_index = 1; 
		
		// E já aproveita para checar se ele clicou ENQUANTO está em cima
		if (device_mouse_check_button_pressed(0, mb_left))
		{
			global.tempo_sem_clt = 0;
			global.coletados = 0;
			global.vel = 1; 
			
			room_goto(rm_jogo);
		}
	}
	
	// Agora sim desenha o botao
	draw_sprite(spr_botao, _img_index, _botao_x, _botao_y);
	
	// TEXTO DO BOTÃO
	draw_set_halign(1); // fa_center é a constante do GameMaker para alinhamento central
	draw_set_valign(1); // fa_middle centraliza a altura do texto
	
	// Define a cor da fonte
	draw_set_colour(c_white); 
	
	
	// Desenha o texto exatamente nas mesmas coordenadas (x, y) do botão
	if (point_in_rectangle(_mouse_x, _mouse_y, _esq, _cima, _dir, _baixo))
	{
		_botao_y =	_altura_gui - 90; 
	}
	draw_text(_botao_x, _botao_y - 5, "Demitir-se");
	
	// Reseta os alinhamentos e cores para o padrão para não bugar o resto do jogo!
	draw_set_halign(-1);
	draw_set_valign(-1);
	draw_set_colour(c_white);
}

#endregion