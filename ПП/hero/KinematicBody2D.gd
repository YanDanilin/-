extends KinematicBody2D


signal health_updated(health)
signal killed()

var speed = 250
onready var animated_sprite = $AnimatedSprite

export (int) var max_health = 100
onready var health = max_health setget _set_health
onready var invalnerable_time = $InvalnerableTimer


func _physics_process(_delta: float):
	var move_direction = Vector2.ZERO
	move_direction = Vector2(Input.get_action_strength("move_right") - Input.get_action_strength("move_left"), 
		Input.get_action_strength("move_down")/float(2) - Input.get_action_strength("move_up")/float(2))
	_play_move_animation(move_direction)
	move_and_slide(move_direction.normalized() * speed)
	
	

func _play_move_animation(move_direction: Vector2):
	if move_direction.x != 0 or move_direction.y != 0:
		
		if move_direction.x < 0:
			animated_sprite.flip_h = true
		elif move_direction.x > 0:
			animated_sprite.flip_h = false
		
		animated_sprite.play("run")
	else: animated_sprite.play("idle")
	
#func _cartesian(cartesian: Vector2):
	#var iso = Vector2()
	#iso.x = cartesian.x - cartesian.y
	#iso.y = (cartesian.x + cartesian.y)/2
#	return Vector2(cartesian.x - cartesian.y, (cartesian.x + cartesian.y)/2)

func damage(amount):
	#if invalnerable_time.is_stopped():
	#	invalnerable_time.start()
		_set_health(health - amount)
		animated_sprite.play("take_hit")
	
func death():
	$AnimatedSprite.play("death")

func _set_health(value):
	var prev_health = health
	health = clamp(value, 0, max_health)
	if prev_health != health:
		emit_signal("health_updated", health)
		if health == 0:
			death()
			emit_signal("killed")
