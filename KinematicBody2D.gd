extends KinematicBody2D

const MOVE_SPEED = 500
const JUMP_FORCE = 1000
var GRAVITY = 50
const MAX_FALL_SPEED = 1000

var vivo = true
var game

onready var anim_player = $Sprite

var y_velo = 0


func _ready():
	game = get_tree().current_scene
		
func _physics_process(delta):
	

	var move_dir = 0
	var on_wall = $RayWall.is_colliding();
	var no_chao = $RayD.is_colliding() or $RayE.is_colliding()
	if vivo:
		if Input.is_action_pressed("Right"):
		
			if on_wall and anim_player.flip_h and not is_on_floor():
				y_velo = -JUMP_FORCE + 150
		
			anim_player.flip_h = false
			anim_player.animation = "Run"
			move_dir += 1
			$RayWall.rotation_degrees = 270
			
		elif Input.is_action_pressed("Left"):
		
			if on_wall and not anim_player.flip_h and not is_on_floor():
				y_velo = -JUMP_FORCE + 150
		
			anim_player.flip_h = true
			anim_player.animation = "Run"
			move_dir -= 1
			$RayWall.rotation_degrees = 90
		
		else:
			anim_player.animation = "Idle"
	
		

	
	if no_chao == false and vivo:
		anim_player.animation = "Jump"
	
	move_and_slide(Vector2(move_dir * MOVE_SPEED, y_velo), Vector2(0, -1))
		
	var grounded = is_on_floor()
	y_velo += GRAVITY
	if grounded and vivo and Input.is_action_just_pressed("jump"):
		y_velo = -JUMP_FORCE
	if grounded and y_velo >= 0:
		y_velo = 5
	if y_velo > MAX_FALL_SPEED:
		y_velo = MAX_FALL_SPEED
		
func Die():
	vivo = false
	GRAVITY = 0
	y_velo = 0
	anim_player.play("Dead")
	yield($Sprite,"animation_finished")
	get_tree().reload_current_scene()