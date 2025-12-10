extends CharacterBody2D

const SPEED = 85
const ROTATION_SPEED = 2

@onready var _animated_sprite = $CharSprite
@export var use_sword = false

var rotation_direction
var move_axis
var zombie_around = false
var zombie = TYPE_NIL
var last_hit: float

func _physics_process(delta: float) -> void:
	if Input.is_action_pressed("ui_shift"):
		var _time = Time.get_ticks_usec() / 1000**2
		#print(_time - last_hit)
		if _time - last_hit >= 0.5:
			last_hit = _time
			_animated_sprite.play("punch_p" if use_sword else "punch_tk")
			if zombie_around:
				print(zombie.hited)
			if zombie_around:
				if zombie.hited < 3:
					zombie.hited += 1
	else:
		rotation_direction = Input.get_axis("ui_left", "ui_right")
		move_axis = Input.get_axis("ui_up", "ui_down")
		rotation += rotation_direction * ROTATION_SPEED * delta
		
		if (move_axis && move_axis <= 0) || rotation_direction:
			_animated_sprite.play("walk_p" if use_sword else "walk_tk")
		else:
			_animated_sprite.play("meneng_p" if use_sword else "meneng_tk")
		
		if move_axis <= 0:
			velocity = transform.y * move_axis * SPEED * -1

	move_and_slide()

func _zombie_enter_area(body):
	if body.has_method("zombie"):
		zombie = body
		zombie_around = true
		
func _zombie_exit_area(body):
	if body.has_method("zombie"):
		zombie = TYPE_NIL
		zombie_around = false

func player():
	pass
