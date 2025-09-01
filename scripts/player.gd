extends CharacterBody2D

@export var speed :float = 200.0
@export var acceleration :float = 10.0

@onready var bullet = preload("res://scenes/player_bullet/bullet.tscn")
@onready var level = get_parent()
@onready var _ship = $ship_sprite


func shoot():
	var instance = bullet.instantiate()
	instance.dir = rotation
	instance.spawn = global_position
	instance.spawnRot = rotation
	instance.zdex = z_index -1
	level.add_child.call_deferred(instance)
	
#func _process(delta):
	#if Input.is_action_pressed("ui_right"):
		#position += Vector2(1, 0) * 70 * delta
		#print("moving right")
	#elif Input.is_action_pressed("ui_left"):
		#position += Vector2(-1, 0) * 70 * delta
		#print("moving left")
	#if Input.is_action_pressed("ui_up"):
		#position += Vector2(0, -1) * 70 * delta
		#print("moving up")
	#elif Input.is_action_pressed("ui_down"):
		#position += Vector2(0, 1) * 70 * delta
		#print("moving down")
		
func get_input(delta: float) -> void:
	var input_direction = Input.get_vector("left", "right", "up", "down").normalized()
	velocity = velocity.move_toward(input_direction * speed, acceleration)
	position += velocity * delta
	
	

func _process(delta: float) -> void:
	get_input(delta)	
	position.x = clamp(position.x, 17 , 943)
	position.y = clamp(position.y, 15 , 525)
	
func _physics_process(delta: float) -> void:
	if Input.is_action_pressed("shoot"):
		shoot()
	move_and_slide()
	move_and_collide(velocity*delta)
