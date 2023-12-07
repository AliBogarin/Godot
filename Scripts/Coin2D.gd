extends Area2D

signal coins_colector
var sound_coins = preload("res://Sounds/coin_sounds/coin10.wav")

func _ready():
	# Crea un nuevo AudioStreamPlayer
	var audio_player = AudioStreamPlayer.new()
	# Configura el stream del AudioStreamPlayer para que sea coin_sound
	audio_player.stream = sound_coins
	
	# Añade el AudioStreamPlayer a la escena
	add_child(audio_player)

func _on_Coin2D_body_entered(body):

	#si el jugador cae que vuelva resetear la moneda
	if body.get_name() == "Player":
		
	#llamo aqui al addCoin el que esta en el player
		body.add_Coin()
		emit_signal("coins_colector")
		get_node("AudioStreamPlayer").play()
		
		queue_free()
		pass # Replace with function body.
		
#llamo aqui al addCoin el que esta en el player
