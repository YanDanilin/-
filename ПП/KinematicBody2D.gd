extends KinematicBody2D


var speed = 250
onready var animated_sprite = $AnimatedSprite



func _physics_process(_delta: float):
	var move_direction = Vector2.ZERO
	
	#if Input.is_action_pressed("move_left"):
	#	move_direction.x = -1
	#elif Input.is_action_pressed("move_right"):
	#	move_direction.x = 1
	#elif Input.is_action_pressed("move_down"):
	#	move_direction.y = 1
	#elif Input.is_action_pressed("move_up"):
	#	move_direction.y = -1
	#move_direction = _cartesian(move_direction)
	move_direction = Vector2(Input.get_action_strength("move_right") - Input.get_action_strength("move_left"), Input.get_action_strength("move_down")/float(2) - Input.get_action_strength("move_up")/float(2))
	_play_move_animation(move_direction)
	move_and_slide(move_direction.normalized() * speed)
	
	

func _play_move_animation(move_direction: Vector2):
	if move_direction.x != 0 or move_direction.y != 0:
		
		if move_direction.x < 0:
			animated_sprite.flip_h = true
		elif move_direction.x > 0:
			animated_sprite.flip_h = false
		
		animated_sprite.play("walk")
	else: animated_sprite.play("idle")
	
#func _cartesian(cartesian: Vector2):
	#var iso = Vector2()
	#iso.x = cartesian.x - cartesian.y
	#iso.y = (cartesian.x + cartesian.y)/2
#	return Vector2(cartesian.x - cartesian.y, (cartesian.x + cartesian.y)/2)
	 
