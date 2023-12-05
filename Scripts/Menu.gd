extends Control



func _ready():
	#esta linea es para funcionar arriba abajo con teclado, y siempre puedo con ratón
	$VBoxContainer/StartButton.grab_focus()


#Botrones para empezar la partida
func _on_StartButton_pressed():
	 get_tree().change_scene("res://Escena/Mundo1.tscn")
	

func _on_QuitButton_pressed():
	get_tree().quit()

