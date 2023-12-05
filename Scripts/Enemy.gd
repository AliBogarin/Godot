extends KinematicBody2D

var gravity =10
var speed = 25
var velocity = Vector2(0,0)
var moving_left = true

func _ready():
	$AnimationPlayer.play("Walk")
	
	
func _process(delta):
	move_character() #para mover mi enemigo, es importante crearlo la funcion en ese orden
	turn()
	
func move_character():
	
	velocity.y += gravity
	
	if moving_left:
		velocity.x = - speed # movimiento hacia la izquierda
		velocity = move_and_slide(velocity, Vector2.UP)
		
	else:
		velocity.x =  speed
		velocity = move_and_slide(velocity, Vector2.UP)

func _on_Area2D_body_entered(body):
		if body.get_name() == "Player":
			body._loseLife(position.x) #le paso la posición x de mi enemigo (horizontal)
			pass

func turn():
	if not $RayCast2D.is_colliding():
		moving_left = !moving_left
		scale.x  = -scale.x #para cambiar de direccion
