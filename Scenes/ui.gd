extends Node

signal menu_opened

var menu_visibility  := false

var current_menu_option := 0
var current_menu := 0
var max_menu_option : int

@onready var initial_container = $MarginContainer


#handle menu function
#show menu function

func _process(delta: float) -> void:
	handle_menu()


func handle_menu():
	if Input.is_action_just_pressed("menu"):
	
		if menu_visibility == false:
			current_menu_option = 0
			current_menu = 0
		
		menu_visibility = not menu_visibility
		self.visible = menu_visibility
	
	if menu_visibility:
		
		var current_menu_node = initial_container.get_child(current_menu)
		max_menu_option = current_menu_node.get_child_count()
		
		if Input.is_action_just_pressed("down") and current_menu_option < max_menu_option - 1:
			current_menu_option += 1
		if Input.is_action_just_pressed("up") and current_menu_option > 0:
			current_menu_option -= 1
		
		
		
		
		
		
		for menu_options in range(max_menu_option):
			var current_menu_option_node = current_menu_node.get_child(menu_options)
			if menu_options == current_menu_option:
				current_menu_option_node.text = "munt"
			else: 
				current_menu_option_node.text = "goon"
