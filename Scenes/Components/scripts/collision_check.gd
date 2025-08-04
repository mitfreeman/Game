extends Node2D
class_name CollisionCheck

var tile_size = 16

func check_raycast_collision(target_position) -> bool:
	$RayCast2D.target_position = target_position * tile_size
	$RayCast2D.force_raycast_update()
	return !$RayCast2D.is_colliding()
