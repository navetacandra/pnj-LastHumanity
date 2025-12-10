extends Node2D

var _collected = false
@onready var _animated_sprite = $AnimatedSprite2D

func _ready() -> void:
	_animated_sprite.play("default")
	pass

func _process(delta: float) -> void:
	pass

func _on_area_entered(body):
	if body.has_method("player"):
		if !_collected:
			_collected = true
			_animated_sprite.play("collected")
