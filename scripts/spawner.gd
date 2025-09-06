extends Node2D

var rocks := [
	preload("res://scenes/meteors/big_meteor.tscn"),
	preload("res://scenes/meteors/medium_meteor.tscn"),
	preload("res://scenes/meteors/small_meteor.tscn")
]
@onready var level = get_parent()
@onready var spawnTimer = $spawn_timer

var nextSpawn = 1.0

func _ready() -> void:
	randomize()
	spawnTimer.start(nextSpawn)
	



func _on_spawn_timer_timeout() -> void:
	var rect = get_viewport_rect()
	var xpos = randi_range(rect.position.x, rect.end.x)
	var meteor_preload = rocks[randi() % rocks.size()]
	var rock : Meteor = meteor_preload.instantiate()
	rock.position = Vector2(xpos, position.y)
	level.add_child.call_deferred(rock)
	
	spawnTimer.start(nextSpawn)
