#region História
	
if (room == rm_inicio)
{
	if (keyboard_check_pressed(vk_space))
	{
		pagina_atual++;
		
		// Muda o background para o proximo index da imagem
		layer_background_index(back_id, pagina_atual);
	}
	
	// Verifica se a pagina atual é igual ou maior que total de páginas
	if (pagina_atual >= total_paginas)
	{
		room_goto(rm_jogo);
	}
}

#endregion

#region Jogo
	
if (room == rm_jogo)
{
	layer_vspeed(lay_id, global.vel);
	global.vel += global.vel_increment;
}
	
#endregion

show_debug_message(layer_get_vspeed(lay_id))