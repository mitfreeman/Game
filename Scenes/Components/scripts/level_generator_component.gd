extends Node2D
class_name LevelGeneratorComponent

const WIDTH = 80
const HEIGHT = 60
const CELL_SIZE = 16
const MIN_ROOM_SIZE = 5
const MAX_ROOM_SIZE = 10
const MAX_ROOMS = 10

var grid = []
var rooms = []

@export var floor_tile_map : TileMapLayer
@export var wall_tile_map : TileMapLayer

func _ready() -> void:
	initialize_grid()
	generate_dungeon()
	draw_dungeon()

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("down"):
		initialize_grid()
		generate_dungeon()
		draw_dungeon()

func initialize_grid() -> void:
	for x in range(WIDTH):
		grid.append([])
		for y in range(HEIGHT):
			grid[x].append(1)

func generate_dungeon() -> void:
	for i in range(MAX_ROOMS):
		var room = generate_room()
		if place_room(room):
			if rooms.size() > 0:
				connect_rooms(rooms[-1], room)
			
			rooms.append(room)

func generate_room() -> Rect2:
	var width = randi() % (MAX_ROOM_SIZE - MIN_ROOM_SIZE + 1) + MIN_ROOM_SIZE
	var height = randi() % (MAX_ROOM_SIZE - MIN_ROOM_SIZE + 1) + MIN_ROOM_SIZE
	var x = randi() % (WIDTH - width - 1) + 1
	var y = randi() % (HEIGHT - height) + 2
	return Rect2(x, y, width, height)

func place_room(room : Rect2) -> bool:
	for x in range(room.position.x, room.end.x):
		for y in range(room.position.y, room.end.y):
			if grid[x][y] == 0:
				return false
	
	for x in range(room.position.x, room.end.x):
		for y in range(room.position.y, room.end.y):
			grid[x][y] = 0
	return true

func connect_rooms(room1, room2, corridor_width = 1):
	
	var start = Vector2(
		int(room1.position.x + room1.size.x / 2),
		int(room1.position.y + room1.size.y / 2)
	)
	
	var end = Vector2(
		int(room2.position.x + room2.size.x / 2),
		int(room2.position.y + room2.size.y / 2)
	)
	
	var current = start
	
	while current.x != end.x:
		# Move one step left or right
		current.x += 1 if end.x > current.x else -1
		# Create a corridor with the specified width
		for i in range(-int(corridor_width / 2), int(corridor_width / 2) + 1):
			for j in range(-int(corridor_width / 2), int(corridor_width / 2) + 1):
				# Ensure we don't go out of grid bounds
				if current.y + j >= 0 and current.y + j < HEIGHT and current.x + i >= 0 and current.x + i < WIDTH:
					grid[current.x + i][current.y + j] = 0  # Set cells to floor
	
	while current.y != end.y:
		# Move one step up or down
		current.y += 1 if end.y > current.y else -1
		# Create a corridor with the specified width
		for i in range(-int(corridor_width / 2), int(corridor_width / 2) + 1):
			for j in range(-int(corridor_width / 2), int(corridor_width / 2) + 1):
				# Ensure we don't go out of grid bounds
				if current.x + i >= 0 and current.x + i < WIDTH and current.y + j >= 0 and current.y + j < HEIGHT:
					grid[current.x + i][current.y + j] = 0  # Set cells to floor

func draw_dungeon():
	# Loop through each cell in the grid
	for x in range(WIDTH):
		for y in range(HEIGHT):
			var tile_position = Vector2i(x, y)
			floor_tile_map.set_cell(tile_position, 0, Vector2i(1,0))
			if grid[x][y] == 1:
				wall_tile_map.set_cell(tile_position, 0, Vector2i(1,0))
