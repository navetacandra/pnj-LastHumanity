extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var global_mouse_position = get_global_mouse_position()
	print("Mouse Click/Unclick at: ", event.position)
	pass
