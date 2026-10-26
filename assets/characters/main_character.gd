extends Node2D

const SPEED := 300.0
const STOP_DISTANCE := 2.0

var target_position: Vector2
var moving := false

@onready var sprite: AnimatedSprite2D = $Sprite2D

func _ready() -> void:
	target_position = global_position
	sprite.play("idle")

func _unhandled_input(event: InputEvent) -> void:
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		target_position = get_global_mouse_position()
		moving = true

func _physics_process(delta: float) -> void:
	if not moving:
		return

	var to_target := target_position - global_position
	if to_target.length() <= STOP_DISTANCE:
		moving = false
		sprite.play("idle")
		return

	_update_animation(to_target)
	global_position = global_position.move_toward(target_position, SPEED * delta)

func _update_animation(direction: Vector2) -> void:
	if abs(direction.x) > abs(direction.y):
		sprite.play("right" if direction.x > 0 else "left")
	else:
		sprite.play("down" if direction.y > 0 else "up")
