extends RayCast2D
class_name CollisionCheck

var tile_size = 16

func _ready() -> void:
	target_position = Vector2.ZERO

func check_raycast_collision(target) -> bool:
	target_position = target * tile_size
	force_raycast_update()
	return is_colliding()

func check_collision_at_point(target):
	var space_state = get_world_2d().direct_space_state
	var query = PhysicsPointQueryParameters2D.new()
	query.set_collision_mask(1)
	query.set_position(target * 16 + self.global_position)
	var result = space_state.intersect_point(query)
	return result

	if result.size() > 0:
		print("Something is at that point:", result[0])
	else:
		print("Nothing detected at that point.")
