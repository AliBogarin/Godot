extends Area2D



func _on_Area2D_body_entered(body):
		if body.get_name() == "Player":
			$FallenSound.playing = true
			print (body.get_name())
			print ("He caido!")
			yield(get_tree().create_timer(0.1),"timeout")
			get_tree().reload_current_scene()

