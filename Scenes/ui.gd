extends Node

var menu_visibility  := false

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("menu"):
		
		menu_visibility = not menu_visibility
		$CanvasLayer.visible = menu_visibility
