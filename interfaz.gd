extends CanvasLayer

signal iniciarJuego

func mostrarMensaje(texto):
	$lblMensaje.text = texto
	$lblMensaje.show()
	$mensajeTimer.start()
	
func gameOver():
	mostrarMensaje("CORRE AL HOSPITAL MAS CERCANO")
	yield($mensajeTimer, "timeout")
	$btnPlay.show()
	$lblMensaje.text = "MOSQUIKILL"
	$lblMensaje.show()
	$lblScore.text = "0"
	
func updateScore(Puntos):
	$lblScore.text = str(Puntos)
	

func _on_mensajeTimer_timeout():
	$lblMensaje.hide()


func _on_btnPlay_pressed():
	$btnPlay.hide()
	emit_signal("iniciarJuego")
