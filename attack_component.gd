extends Node2D
class_name AttackComponent

signal hit(target)

@export var attacks: Array[Attack]

var attack_dictionary = {
	'basic' : 0 ,
	'strong' : 1
}

func attack_melee(attack : String, direction : Vector2) -> void:
	
	var current_attack = attacks[attack_dictionary[attack]]
	var collision_check = $CollisionCheck.check_collision_at_point(direction)
	
	print(collision_check)
	if collision_check.size() > 0:
		for hit in collision_check:
			var collider = hit.collider
			var target_health_component = collider.get_node('HealthComponent')
			if target_health_component:
				target_health_component.take_damage(current_attack.power)
				print('hit:' , collider.name, 'current health:' , target_health_component.current_health)
