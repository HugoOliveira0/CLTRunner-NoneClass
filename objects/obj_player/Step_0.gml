#region Movimentação Horizontal

var _dir = -keyboard_check_pressed(vk_left) +keyboard_check_pressed(vk_right);

if (_dir > 0)
{
	image_xscale = -1;
	x_alvo = lado_dir;
}
else if(_dir < 0)
{
	image_xscale = 1;
	x_alvo = lado_esq;
}

x = lerp(x, x_alvo, 0.2);

#endregion

#region Movimentação Horizontal (Mobile)

if (room == rm_jogo)
{
	var _largura_gui = display_get_gui_width(); // Pega a largura real da GUI
	var _toque_x = device_mouse_x_to_gui(0)

	if (mouse_check_button_pressed(mb_left))
	{
		if (_toque_x < _largura_gui / 2)	
		{
			image_xscale = 1;
			x_alvo = lado_esq;
		}
		else if (_toque_x > _largura_gui / 2)
		{
			image_xscale = -1;
			x_alvo = lado_dir;	
		}
		
		x = lerp(x, x_alvo, 0.2);
	}
}
#endregion