extends CollisionCheck

class_name AttackComponent

signal hit

func attack(position : Vector2, amount_of_damage : float):
	check_raycast_collision(position)
	
	pass
