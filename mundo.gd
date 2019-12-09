extends Node

export (PackedScene) var mosquito
var Score 

func _ready():
	randomize()	
	
func nuevoJuego():
	Score = 0
	$Player.Inicio($posicionInicial.position)
	$inicioTimer.start()
	$interfaz.mostrarMensaje("CORRE FORREST,\n CORRE")
	$interfaz.updateScore(Score)
	$audioAbulancea.stop()
	$audioMoscas.play()

func gameOver():
	$scoreTimer.stop()
	$mosquitoTimer.stop()
	$interfaz.gameOver()
	$audioAbulancea.play()
	$audioMoscas.stop()


func _on_inicioTimer_timeout():
	$mosquitoTimer.start()
	$scoreTimer.start()


func _on_scoreTimer_timeout():
	Score +=1
	$interfaz.updateScore(Score)
	
	

func _on_mosquitoTimer_timeout():
	#lugar aleatorio del mosquito
	$camino/mosquitoPosicion.set_offset(randi())
	
	var mosquitou = mosquito.instance()
	add_child(mosquitou)
	
	var direccion = $camino/mosquitoPosicion.rotation + PI/2
	
	mosquitou.position = $camino/mosquitoPosicion.position
	
	direccion += rand_range(-PI/4,PI/4)
	mosquitou.rotation = direccion
	mosquitou.set_linear_velocity(Vector2(rand_range(mosquitou.velocidadMinima, mosquitou.velocidadMaxima),0).rotated(direccion))

func _on_Area2D_body_entered(body):
	
	
	if "Player" in body.get_name():
		$interfaz.FinalOver()
	
	
