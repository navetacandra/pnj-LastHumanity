extends Camera2D

var _prev_viewport_size: Vector2 = Vector2.ZERO
@export var base_zoom: float = 202.50

func _ready() -> void:
	_prev_viewport_size = get_viewport().size
	_update_zoom(_prev_viewport_size)

func _process(delta: float) -> void:
	var current_size = get_viewport().size
	if (current_size.x != _prev_viewport_size.x) || (current_size.y != _prev_viewport_size.y):
		_prev_viewport_size = current_size
		_update_zoom(current_size)

func _update_zoom(viewport_size: Vector2) -> void:
	var viewport_height: float = viewport_size.y
	var scale_factor: float = viewport_height / base_zoom
	zoom = Vector2(scale_factor, scale_factor)
