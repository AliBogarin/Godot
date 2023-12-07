extends Node2D

var coins 

func playSound(sound):
	if sound == "coin":
		get_node("/root/Mundo1/MusicCoins/AudioStreamPlayerv").play()
