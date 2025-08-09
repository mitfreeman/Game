extends Node2D
class_name MovementComponent

@export var speed = 0.25
@export var tile_size = 16

var moving = false
var direction_facing = Vector2.ZERO

func move(body : CharacterBody2D, input_direction : Vector2, collision_check : Array) -> void:
	direction_facing = input_direction
	if input_direction and collision_check.size() == 0 and moving == false:
		moving = true
		var move_tween = create_tween()
		move_tween.set_process_mode(Tween.TWEEN_PROCESS_PHYSICS)
		move_tween.tween_property(body, "position", body.position + input_direction * tile_size, 0.25)
		move_tween.tween_callback(move_false)

func move_false():
	moving = false
