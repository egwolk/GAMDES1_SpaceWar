extends CharacterBody2D

@export var speed = 400
@onready var _animated_sprite = $AnimatedSprite2D

	
func get_input():
	var input_direction = Input.get_vector("left", "right", "up", "down")
	velocity = input_direction * speed
	if input_direction.x > 0:
		_animated_sprite.play("turn_right_trans")
		_animated_sprite.play("turn_right")
	elif input_direction.x < 0:
		_animated_sprite.play("turn_left_trans")
		_animated_sprite.play("turn_left")
	else:
		_animated_sprite.play("default")

@warning_ignore("unused_parameter")
func _physics_process(delta):
	get_input()
	move_and_slide()
	#
	#var viewRect := get_viewport_rect()
	#position.x = clamp(position.x, -50, viewRect.size.x)
	#position.y = clamp(position.y, 0, viewRect.size.y)
	
