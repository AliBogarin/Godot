extends Area2D

signal coins_collector


func _on_Coin2D_body_entered(body):
	#si el jugador cae que vuelva resetear la moneda
	if body.get_name() == "Player":
	#llamo aqui al addCoin el que esta en el player
		body.add_Coin()
		$Sound.playing = true
		# Esperar a que termine la reproducción antes de liberar el nodo
		yield(get_tree().create_timer(0.2),"timeout")
	
		emit_signal("coins_collector")
		
		queue_free()
		pass # Replace with function body.
		
#llamo aqui al addCoin el que esta en el player



