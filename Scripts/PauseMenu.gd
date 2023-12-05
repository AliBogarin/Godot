extends Control


func _ready(): #para desactivar desde el principio para no desactivar el la tecla
	visible = false


func _input(event):
	if event.is_action_pressed("pause"):
		print("Estoy pausado!")
		visible = not  get_tree().paused #si esta pausado se visualiza
		get_tree().paused = not get_tree().paused #va a recorrer el nodo principal y lo va a pausar, es un interruptor


