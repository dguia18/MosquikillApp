extends CanvasLayer

signal iniciarJuego
signal down
signal up
signal left
signal rigth
signal noleft
signal nodown
signal noup
signal norigth

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


func _on_btnLeft_pressed():
	emit_signal("left")


func _on_btnUp_pressed():
	emit_signal("up")


func _on_btnRight_pressed():
	emit_signal("rigth")


func _on_btnDown_pressed():
	emit_signal("down")


func _on_btnLeft_button_up():
	emit_signal("noleft")


func _on_btnRigth_button_up():
	emit_signal("norigth")


func _on_btnUp_button_up():
	emit_signal("noup")


func _on_btnDown_button_up():
	emit_signal("nodown")
