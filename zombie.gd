extends CharacterBody2D


const SPEED = 20
const JUMP_VELOCITY = -400.0

@onready var _animated_sprite = $Sprite
@onready var _collision = $Collision
@export var hited = 0

var movement = Vector2.ZERO
var suffix = ""
var prefix = ""
var alive = true
var orc = false
var shift = false

func zombie_move():
	movement = Input.get_vector("ui_a", "ui_d", "ui_w", "ui_s")
	
	if movement.x < 0:
		suffix = "a"
	elif movement.x > 0:
		suffix = "d"
	if movement.y < 0:
		suffix = "w"
	elif movement.y > 0:
		suffix = "s"
	
	if movement.x == 0 && movement.y == 0:
		_animated_sprite.play(prefix+"idle_"+suffix)
	else:
		_animated_sprite.play(prefix+"walk_"+suffix)
	
	velocity = movement * SPEED

func _ready() -> void:
	suffix = "s"
	_animated_sprite.play(prefix+"idle_"+suffix)
	pass

func _physics_process(delta: float) -> void:
	if hited >= 3:
		if alive:
			if orc:
				_animated_sprite.scale.x = 0.738
				_animated_sprite.scale.y = 0.77
				_collision.scale.x = 0.45
				_collision.scale.y = 0.45
			alive = false
			_animated_sprite.play(prefix+"die_animate")
			await _animated_sprite.animation_finished
		else:
			_animated_sprite.play(prefix+"die")
		move_and_slide()
		pass
		
	if Input.is_action_pressed("ui_r"):
		hited = 0
		alive = true
		if orc:
			_animated_sprite.scale.x = 1.05
			_animated_sprite.scale.y = 1.05
			_collision.scale.x = 0.5
			_collision.scale.y = 0.5
	
	if Input.is_action_pressed("ui_q") && !shift:
		orc = !orc
		shift = true
		
		if orc:
			prefix = "orc_"
			_animated_sprite.scale.x = 1.05
			_animated_sprite.scale.y = 1.05
			_collision.scale.x = 0.5
			_collision.scale.y = 0.5
		else:
			prefix = ""
			_animated_sprite.scale.x = 0.738
			_animated_sprite.scale.y = 0.77
			_collision.scale.x = 0.45
			_collision.scale.y = 0.45
		await get_tree().create_timer(0.5, true, true).timeout
		shift = false
	
	if alive:
		zombie_move()
	
	move_and_slide()

func zombie():
	pass
