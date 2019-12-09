extends RigidBody2D

export (int) var velocidadMinima
export (int) var velocidadMaxima
onready var interfaz = get_parent().get_node("/root/interfaz")

func _ready():
	$mosquitoSprite.animation = "volando"
	

func _on_VisibilityNotifier2D_screen_exited():
	queue_free()#elimina el mosquito


func _on_Area2D_body_entered(body):	
	
	if body.get_name()== "Player":
		pass
		
