# StarMenu.gd
extends Control

func _on_BotaoInicio_pressed():
	get_tree().change_scene("res://Scenes/Fase1.tscn")

func _on_FecharJogo_pressed():
	get_tree().quit()
