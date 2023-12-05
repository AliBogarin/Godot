extends Node2D


func _ready():
	$AnimationPlayer.play("RotationSaw")
	


func _on_Area2D_body_entered(body):
	if body.get_name() == "Player":
		body._loseLife(position.x) #le paso el parametro para que no de error cuando me toque mi enemiguito
		pass
		
