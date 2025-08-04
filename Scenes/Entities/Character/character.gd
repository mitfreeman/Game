extends CharacterBody2D

const TILE_SIZE = 16

@export var movement_component : MovementComponent
@export var input_component : InputComponent
@export var collision_check : CollisionCheck
@export var health_component : HealthComponent
#@export var attack_component : AttackComponent

func _ready() -> void:
	position = position.snapped(Vector2.ONE * TILE_SIZE)
	position += Vector2.ONE * TILE_SIZE/2
	position.y -= 4

func _process(delta: float) -> void:
	if input_component.input_direction:
		movement_component.move(self, input_component.input_direction, collision_check.check_raycast_collision(input_component.input_direction))
	print(movement_component.direction_facing)
	#if input_component.attack:
	#	attack_component.attack()
