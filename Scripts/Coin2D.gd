extends Area2D

signal coins_colector

func _on_Coin2D_body_entered(body):
	#si el jugador cae que vuelva resetear la moneda
	if body.get_name() == "Player":
	#llamo aqui al addCoin el que esta en el player
		body.add_Coin()
		emit_signal("coins_colector")
		queue_free()
		pass # Replace with function body.
		
#llamo aqui al addCoin el que esta en el player
