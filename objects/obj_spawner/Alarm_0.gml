// Quando o alarm tocar

var _tempo = irandom_range(1, 3)

// Definir o lado e criar uma var para o coletavel
var _lado = choose(lado_esq, lado_dir);
var _consumivel = instance_create_layer(_lado, -32, "Instances", obj_coletavel )

_consumivel.vspeed = 1;

// Se for do lado direito, muda o xscale do coletavel
if (_lado == lado_dir)
{
	_consumivel.image_xscale = -1;	
}


alarm[0] = game_get_speed(gamespeed_fps) * _tempo;