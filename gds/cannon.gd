extends Node2D

@onready var level = get_tree().get_root().get_node("level")
@onready var bullet = load("res://scenes/bullets.tscn")

func _ready():
	_on_cooldown_timeout()
	
func shoot():
	var instance = bullet.instantiate()
	instance.dir = rotation
	instance.spawn = global_position
	instance.spawnRot = rotation
	instance.zdex = z_index -1
	level.add_child.call_deferred(instance)

func _on_cooldown_timeout():
	shoot()
