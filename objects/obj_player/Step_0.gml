#region Movimentação Horizontal

var _dir = -keyboard_check_pressed(vk_left) +keyboard_check_pressed(vk_right);

if (_dir > 0)
{
	image_xscale = -1;
	x_alvo = dist_dir;
}
else if(_dir < 0)
{
	image_xscale = 1;
	x_alvo = dist_esq;
}

x = lerp(x, x_alvo, 0.2);

#endregion