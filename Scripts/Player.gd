extends KinematicBody2D

const moveSpeed = 25
const maxSpeed =  50
const jumpHeigh = -300
const up = Vector2(0,-1)
const gravity = 15

onready var sprite = $Sprite

onready var animationPlayer = $AnimationPlayer

var motion  = Vector2()
var lifes = 3

func _physics_process(delta): 
	motion.y += gravity
	
	var friction  = false
	
	if  Input.is_action_pressed("ui_right"):
		
		sprite.flip_h= true
		animationPlayer.play("Walk")
		motion.x = min(motion.x + moveSpeed, maxSpeed)
		
	elif Input.is_action_pressed("ui_left"):
		
		sprite.flip_h = false
		animationPlayer.play("Walk")
		motion.x = max(motion.x - moveSpeed,- maxSpeed)
		
	else:
		
		animationPlayer.play("Idle")
		friction = true
	
	if is_on_floor():
		
		if Input.is_action_pressed("ui_accept"):
			
			motion.y = jumpHeigh
			
		if friction == true:
			
			motion.x = lerp(motion.x ,0,0.5)
			
	else:
			
		if friction == true:
				
			motion.x = lerp(motion.x,0,0.01)
				
	motion = move_and_slide(motion, up)
	
	#para aumetar la moneda cuando lo cojo, cada vez que colisione con el
func add_Coin():
	
	 var canvasLayer = get_tree().get_root().find_node("CanvasLayer", true, false)
	#llamo aqui al metodo de contar monedas
	 canvasLayer.handelCoinCollected()
	
func  _loseLife(var enemyposx):
	#rint("Sierra!, he perdido vida!")
	#get_tree().reload_current_scene() # este metodo reinicio
	
	#Esto me ayuda a saber las vida que tengo
	if position.x < enemyposx:
		motion.x = -200
		motion.y = -100
		
		
	if position.x > enemyposx:
		motion.x = 200
		motion.y = -100
	lifes = lifes -1	
	print("Cuidado!, he perdido vida!: " +str(lifes))
	
	var canvasLayer = get_tree().get_root().find_node("CanvasLayer", true, false)
	#para activar y desactivar vida
	canvasLayer.handleHearts(lifes)
	
	if lifes<= 0:
		get_tree().reload_current_scene() #recargo vida
	
	
#esta función hace que el jugador reinicie la petida cuando se pincha con el spike
func _on_Spike_body_entered(body):
		if body.get_name() == "Player":
			print (body.get_name())
			print ("Me he pinchado!")
			get_tree().reload_current_scene()


