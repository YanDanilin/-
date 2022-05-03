extends KinematicBody2D


var speed = 150
var presence_detected = false
var attack = false
onready var hero = get_parent().get_node("Hero")


func _on_DetectHero_body_entered(body):
	presence_detected = true

func _on_DetectHero_body_exited(body):
	presence_detected = false

func check_direction(direction: Vector2):
	if direction.x > 0: 
		$AnimatedSprite.flip_h = false
	else: 
		$AnimatedSprite.flip_h = true

func _physics_process(delta):
	var direction = hero.get_global_position() - self.get_global_position()
	check_direction(direction)
	if presence_detected:
		hero.damage(10)
		$AnimatedSprite.play("run")
		move_and_slide(direction.normalized() * speed)
	elif attack:
		$AnimatedSprite.play("attack")
		move_and_slide(direction.normalized() * speed/50)
	else:
		$AnimatedSprite.play("idle")


func _on_AttackActivation_body_entered(body):
	presence_detected = false
	attack = true

func _on_AttackActivation_body_exited(body):
	attack = false
	presence_detected = true
