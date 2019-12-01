extends Area2D
export (int) var velocidad
var movimiento = Vector2()
var limite
signal golpe
# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	#hide()
	limite = get_viewport_rect().size

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	movimiento = Vector2()
	if Input.is_action_pressed("ui_right"):
		movimiento.x += 1
	if Input.is_action_pressed("ui_left"):
		movimiento.x -=1
	if Input.is_action_pressed("ui_up"):
		movimiento.y -=1
	if Input.is_action_pressed("ui_down"):
		movimiento.y +=1
	
	if movimiento.length() >  0:
		movimiento = movimiento.normalized()*velocidad
	
	position += movimiento *delta
	position.x = clamp(position.x, 20, limite.x)
	position.y = clamp(position.y, 0, limite.y)
	$AnimatedSprite.animation = "caminar"
	if movimiento.x != 0:
		$AnimatedSprite.flip_h = movimiento.x > 0
	elif movimiento.y != 0:
		$AnimatedSprite.flip_h = movimiento.y > 0		
	else:
		$AnimatedSprite.animation = "frente"

func _on_Player_body_entered(body):
	hide()
	emit_signal("golpe")
	$collisionPlayer.disabled = true

func Inicio(posicion):
	position = posicion
	show()
	$collisionPlayer.disabled = false