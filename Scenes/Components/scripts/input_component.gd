extends Node2D
class_name InputComponent

var input_direction

func _process(delta: float) -> void:
	input_direction = Vector2.ZERO
	if Input.is_action_pressed("down"):
		input_direction.y += 1
	if Input.is_action_pressed("up"):
		input_direction.y -= 1
	if Input.is_action_pressed("right"):
		input_direction.x += 1
	if Input.is_action_pressed("left"):
		input_direction.x -= 1
