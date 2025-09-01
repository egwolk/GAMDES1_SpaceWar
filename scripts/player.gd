extends CharacterBody2D

@export var speed :float = 200.0
@export var acceleration :float = 15.0
#@export var friction :float = acceleration / speed

#var velocity := Vector2(0,0) 
#@onready var _ship_sprite = $ship_sprite

func _ready():
	#position = Vector2(0, 600)
	#scale = Vector2(.50, .50)
	pass
	
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
	#apply_friction(delta)
	var input_direction = Input.get_vector("left", "right", "up", "down").normalized()
	velocity.x = move_toward(velocity.x, input_direction.x * speed, acceleration)
	velocity.y = move_toward(velocity.y, input_direction.y * speed, acceleration)
	position += velocity * delta
	
	#if input_direction.length() == 0:
		#_ship_sprite.play("booster_off")
	#else:
		#_ship_sprite.play("default")
#func apply_friction(delta: float) -> void:
	#velocity -= velocity * friction * delta

func _process(delta: float) -> void:
	get_input(delta)
	
func _physics_process(delta: float) -> void:
	move_and_slide()
	move_and_collide(velocity*delta)
