/// @description HUD do Game

#region Tela de Jogo

if (room == rm_jogo)
{
	var _largura_gui = display_get_gui_width(); // Pega a largura real da GUI
    var _altura_gui = display_get_gui_height(); // Pega a altura real da GUI
	
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
