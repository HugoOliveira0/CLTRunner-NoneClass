// Quando o alarm tocar

var _tempo = irandom_range(2, 3)

// Definir o lado e criar uma var para o coletavel
var _lado = choose(lado_esq, lado_dir);
var _clt = instance_create_layer(_lado, -50, "Instances", obj_clt )

_clt.vspeed = 1;

// Se for do lado direito, muda o xscale do coletavel
if (_lado == lado_dir)
{
	_clt.image_xscale = -1;	
}


alarm[1] = game_get_speed(gamespeed_fps) * _tempo;