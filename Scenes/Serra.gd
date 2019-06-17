extends Node2D

var game

# Called when the node enters the scene tree for the first time.
func _ready():
	game = get_tree().current_scene

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
func _on_Area2D_body_entered(body):
	
	if body.name == "Player":
		game.game_over()