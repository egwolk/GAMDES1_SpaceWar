extends CharacterBody2D 

@export var SPEED = 1000

var dir : float
var spawn : Vector2
var spawnRot : float
var zdex : int

func _ready():
	global_position = spawn
	global_rotation = spawnRot
	z_index = zdex

func _physics_process(delta):
	velocity = Vector2(0,-SPEED).rotated(dir)
	move_and_slide()

func _on_timer_timeout() -> void:
	queue_free()

func _on_area_2d_body_entered(body):
	if body.is_in_group("player"):
		return
	queue_free()
