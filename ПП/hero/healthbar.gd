extends Control

onready var hero: KinematicBody2D = get_parent().get_parent().get_node("YSort/Hero")
onready var health_bar = $ProgressBar
onready var health_bar_tween: Tween = $ProgressBar/Tween
#mar max_hp

#func _ready():
#	max_hp = 100#hero.health
#	_update_health_bar(100)

#func _update_health_bar(new_value):
#	var a = health_bar_tween.interpolate_property(health_bar, "ProgressBar/value", health_bar.value, new_value, 0.5, Tween.TRANS_QUINT, Tween.EASE_OUT)
#	a = health_bar_tween.start()


