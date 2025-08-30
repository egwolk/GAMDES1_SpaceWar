extends Node2D

var is_exploded := false

func explode():
	if is_exploded:
		return
	is_exploded = true
	get_parent().remove_child(self)
	queue_free() 

func _ready():
	var rect = get_viewport().size
	position = Vector2(randf_range(0, rect.x), -100)
	scale = Vector2(randf_range(.5,1),randf_range(.5,1))
	
func _process(delta):
	position += Vector2(0, .75) * 60 * delta
	rotation += (.5) * 3 * delta
	
