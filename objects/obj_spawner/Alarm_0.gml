/// @description Gerenciar Coletáveis

//Quando o alarm tocar

var _tempo = random_range(1, 3)
var _tempo_calculado = (game_get_speed(gamespeed_fps) * _tempo) / global.vel;

// Definir o lado e criar uma var para o coletavel
var _lado = choose(lado_esq, lado_dir);
var _coletavel = instance_create_layer(_lado, -32, "Instances", obj_coletavel )

_coletavel.vspeed = global.vel;

// Se for do lado direito, muda o xscale do coletavel
if (_lado == lado_dir)
{
	_coletavel.image_xscale = -1;	
	_coletavel.image_yscale = -1;
}

// Impedir que os objetos fiquem no mesmo lugar
with (_coletavel)
{
	// Se nascer a menos de 60 pixels de uma clt
	if (distance_to_object(obj_clt) < 60)
	{
		y -= 64; // Empurro o y bem mais para trás (o dobro de antes)
	}
	
	// Se nascer a menos de 40 pixels de OUTRO coletável
	if (distance_to_object(obj_coletavel) < 40)
	{
		instance_destroy();	
	}
}

alarm[0] = max(_tempo_calculado, 30)