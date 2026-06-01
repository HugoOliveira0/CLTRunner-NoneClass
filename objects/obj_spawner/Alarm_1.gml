/// @description Gerenciar Clt

// Quando o alarm tocar

var _tempo = random_range(2, 4)
var _tempo_calculado = (game_get_speed(gamespeed_fps) * _tempo) / global.vel;

// Definir o lado e criar uma var para o coletavel
var _lado = choose(lado_esq, lado_dir);
var _clt = instance_create_layer(_lado, -32, "Instances", obj_clt )

_clt.vspeed = global.vel;

// Se for do lado direito, muda o xscale do coletavel
if (_lado == lado_dir)
{
	_clt.image_xscale = -1;	
	_clt.image_yscale = -1;
}

// Impedir com que os objetos fiquem no mesmo lugar
with (_clt)
{
	// Se nascer a menos de 60 pixels de um coletável
	if (distance_to_object(obj_coletavel) < 60)
	{
		y -= 64;
	}
	
	// Se nascer a menos de 40 pixels de OUTRA clt
	if (distance_to_object(obj_clt) < 40)
	{
		instance_destroy();	
	}
}

// Impedir que ao ficar muito rápido, fique injogável
alarm[1] = max(_tempo_calculado, 30)