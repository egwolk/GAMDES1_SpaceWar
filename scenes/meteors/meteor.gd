class_name Meteor extends Area2D

@export var minSpeed : float = 10
@export var maxSpeed : float = 20
@export var minRotate : float = -20
@export var maxRotate : float = 20

@export var life : int = 20

var speed : float = 0
var rotationRate : float = 0

func _ready(): 
	#speed = randf_range(minSpeed, maxSpeed)
	#rotationRate = randf_range(minRotate, maxRotate)
	pass
	
func _physics_process(delta: float) -> void:
	rotation_degrees += rotationRate * delta
	position.y += speed * delta

func damage(amount:int):
	life -= amount
	if life <= 0:
		queue_free()


func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	queue_free()


func _on_body_entered(body):
	if body.is_in_group("player"):
		#body.die()
		print("hit")
		queue_free()
