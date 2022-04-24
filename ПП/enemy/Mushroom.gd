extends KinematicBody2D


var speed = 150
var detection = false

func _ready():
	pass # Replace with function body.



func _on_RightAttack_body_entered(body):
	$AnimatedSprite.flip_h = false
	$AnimatedSprite.play("attack")


func _on_RightAttack_body_exited(body):
	$AnimatedSprite.play("idle")


func _on_LeftAttack_body_entered(body):
	$AnimatedSprite.flip_h = true
	$AnimatedSprite.play("attack")

func _on_LeftAttack_body_exited(body):
	$AnimatedSprite.play("idle")

func _on_DetectHero_body_entered(body):
	print("detected")
	print("1")
	body.damage(100)
	#body.death()
