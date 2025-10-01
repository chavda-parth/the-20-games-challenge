class_name PongPlayer
extends RigidBody2D

@export var player_type: PongEnums.PlayerType

var movement_speed: float = 200.0

const MOVE_UP_KEY: String = "move_up"
const MOVE_DOWN_KEY: String = "move_down" 

var input_dict: Dictionary[String, String] = {}


func _ready() -> void:
	match player_type:
		PongEnums.PlayerType.PLAYER_ONE:
			set_input_dict("move_up_1", "move_down_1")
		PongEnums.PlayerType.PLAYER_TWO:
			set_input_dict("move_up_2", "move_down_2")


func _process(delta: float) -> void:
	if Input.is_action_pressed(input_dict[MOVE_UP_KEY]):
		position.y -= 100.0 * delta
	elif Input.is_action_pressed(input_dict[MOVE_DOWN_KEY]):
		position.y += 100.0 * delta


func set_input_dict(move_up_value: String, move_down_value: String) -> void:
	input_dict.set(MOVE_UP_KEY, move_up_value)
	input_dict.set(MOVE_DOWN_KEY, move_down_value)
