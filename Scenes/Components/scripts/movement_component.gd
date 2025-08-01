extends Node
class_name MovementComponent

@export var speed = 0.25
@export var tile_size = 16
var moving = false
var collision_dir = Vector2.ZERO

func move(body : CharacterBody2D, input_direction : Vector2, collision_check : bool) -> void:
	if input_direction and collision_check and moving == false:
		moving = true
		var move_tween = create_tween()
		move_tween.set_process_mode(Tween.TWEEN_PROCESS_PHYSICS)
		move_tween.tween_property(body, "position", body.position + input_direction * tile_size, 0.25)
		move_tween.tween_callback(move_false)

func move_false():
	moving = false
