extends CharacterBody2D

@onready var _animated_sprite = $AnimatedSprite2D


func _ready() -> void:
	_animated_sprite.play("default")
	pass # Replace with function body.

func _physics_process(delta: float) -> void:
	move_and_slide()
