extends KinematicBody2D
export (int) var velocidad
var movimiento = Vector2()
var limite
signal golpe

var upDirection = false
var downDirection = false
var rigthDirection = false
var leftDirection = false
onready var joystick = get_parent().get_node("JoyStick/joyStickButton")

func _ready():
	#hide()
	limite = get_viewport_rect().size

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	movimiento = Vector2()
	if Input.is_action_pressed("ui_right") or rigthDirection:
		movimiento.x += 1
	if Input.is_action_pressed("ui_left") or leftDirection:
		movimiento.x -=1
	if Input.is_action_pressed("ui_up") or upDirection:
		movimiento.y -=1
	if Input.is_action_pressed("ui_down") or downDirection:
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
	move_and_slide(joystick.get_value()*100)
		


func _on_Player_body_entered(body):
	hide()
	emit_signal("golpe")
	$collisionPlayer.disabled = true

func Inicio(posicion):
	position = posicion
	show()
	$collisionPlayer.disabled = false
	

func directionDown():
	downDirection = true
	

func directionUp():
	upDirection = true
	print("llego a up")
	

func directionLeft():
	leftDirection = true
	

func directionRigth():
	rigthDirection = true
	print("eeror")

func _on_interfaz_noleft():
	leftDirection = false
	
func _on_interfaz_noup():
	upDirection = false

func _on_interfaz_nodown():
	downDirection = false
	print("downDirecion: ",downDirection)

func _on_interfaz_norigth():
	rigthDirection = false
