extends CanvasLayer

#para recolectar las monedas y sumarlas
var coins_count = 0
var heart1
var heart2	
var heart3

func _ready():
	heart1 = get_node("Heart1")
	heart2 = get_node("Heart2")
	heart3 = get_node("Heart3")
	
	$Coins_Colection_text.text = String(coins_count)

	

	
func handelCoinCollected():
	print("Coin collected")
	coins_count += 1
	$Coins_Colection_text.text = String(coins_count)
	
	
	if coins_count == 3: 
		#para cambiar de escena esta es la condicion
	#	get_tree().change_scene("res://Escena/Mundo3.tscn")
	# cogere el nombre y su numero y lo comvirto a int, así me da el número, asi puedo ir a numeros infinito de mundos
		yield(get_tree().create_timer(0.1),"timeout")
		get_tree().change_scene("res://Escena/Mundo" + str(int(get_tree().current_scene.name)+1)+".tscn")

func handleHearts(var lifes):
		if lifes == 0:
			heart1.visible = false
		
		if lifes == 1:
			heart2.visible = false
		
		if lifes == 2:
			heart3.visible = false
			
	




