extends Node2D

#load initial scenes into main scene
#var current_world = load("res://Scenes/HubWorld/hub_world.tscn")
#var character = load("res://Scenes/Character/character.tscn")

#crate instances of initial scenes
#var world_instance = current_world.instantiate()
#var character_instance = character.instantiate()

# Called when the node enters the scene tree for the first time.
#func _ready() -> void:
	#add them as children in the main scene
	#add_child(world_instance)
	#add_child(character_instance)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
