// Quando o alarm tocar

tempo = irandom_range(1, 3)

var _lado = choose(lado_esq, lado_dir);
var _consumivel = instance_create_layer(_lado, -32, "Instances", obj_coletavel )

_consumivel.vspeed = 2;

if (_lado == lado_dir)
{
	_consumivel.image_xscale = -1;	
}


alarm[0] = game_get_speed(gamespeed_fps) * tempo;