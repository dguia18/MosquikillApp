extends RigidBody2D

export (int) var velocidadMinima
export (int) var velocidadMaxima

func _ready():
	$mosquitoSprite.animation = "volando"
	

func _on_VisibilityNotifier2D_screen_exited():
	queue_free()#elimina el mosquito
