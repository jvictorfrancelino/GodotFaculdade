extends Control

func _on_BotaoInicio_pressed():
	get_tree().change_scene("res://Scenes/Fase1.tscn")

func _on_SAIR_pressed():
	get_tree().quit()
