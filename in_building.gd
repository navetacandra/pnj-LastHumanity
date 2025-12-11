extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$MainChar.rotation_degrees = 180
	$MainChar.speed = 50
	$MainChar.rotation_speed = 1.5
	#$MainChar._debug_coordinate = true
	$MainChar/MainCam.base_zoom = 90
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
