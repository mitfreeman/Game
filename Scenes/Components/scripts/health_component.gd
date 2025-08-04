extends Node2D
class_name HealthComponent

@export var max_health : float
@export var current_health : float

func set_current_health(expected_health : float):
	if expected_health > max_health:
		current_health = max_health
	else:
		current_health = expected_health

func take_damage(damage_amount : float):
	current_health -= damage_amount

func heal_damage(heal_amount):
	take_damage(0 - heal_amount)
