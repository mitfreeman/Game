extends CharacterBody2D

const TILE_SIZE = 16

@export var movement_component : MovementComponent
@export var collision_check : CollisionCheck
@export var health_component : HealthComponent

func _ready() -> void:
	position = position.snapped(Vector2.ONE * TILE_SIZE)
	position += Vector2.ONE * TILE_SIZE/2
	position.y -= 4

func _process(delta: float) -> void:
	pass
