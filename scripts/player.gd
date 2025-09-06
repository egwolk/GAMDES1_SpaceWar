class_name Player extends CharacterBody2D


@export var speed :float = 100.0
@export var acceleration :float = 10.0
@export var shootDelay :float = 0.1
@export var life : int = 3

@onready var bullet = preload("res://scenes/player_bullet/bullet.tscn")
@onready var level = get_parent()
#@onready var _ship = $ship_sprite
@onready var _guns = $gun_positions
@onready var _shootCD = $shoot_delay
		
		
func shoot():
	for child in _guns.get_children():
		var instance = bullet.instantiate()
		instance.dir = rotation
		instance.spawn = child.global_position
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
	
func damage(amount:int):
	life-=amount
	print("player life: %s" % life)
	if life<=0:
		print("player died")
		queue_free()

func _process(delta: float) -> void:
	get_input(delta)	
	var rect = get_viewport_rect()
	position.x = clamp(position.x, 17 , rect.size.x-17)
	position.y = clamp(position.y, 15 , rect.size.y-15)
	
func _physics_process(delta: float) -> void:
	if Input.is_action_pressed("shoot") and _shootCD.is_stopped():
		_shootCD.start(shootDelay)
		shoot()
	move_and_slide()
	move_and_collide(velocity*delta)
