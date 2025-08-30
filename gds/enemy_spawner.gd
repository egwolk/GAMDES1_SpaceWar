extends Node

var enemy_scn = load("res://scenes/enemy_1.tscn")

func _ready() -> void:
	_spawn_enemy()

func _spawn_enemy():
	var enemy = enemy_scn.instantiate()
	
	_set_enemy_position(enemy)
	add_child(enemy)

func _set_enemy_position(enemy):
	var rect = get_viewport().size
	enemy.position = Vector2(randf_range(0, rect.x), -100)	

func _on_spawn_timer_timeout() -> void:
	_spawn_enemy()
