class_name PongPlayer
extends RigidBody2D
## Responsible for detecting player input and simulating movement.

## The type of player this script is attached to.
@export var player_type: PongEnums.PlayerType

## Movement speed of the player in engine specified unit.
var movement_speed: float = 200.0

## Key corresponding to up input for the player.
const MOVE_UP_KEY: String = "move_up"
## Key corresponding to down input for the player.
const MOVE_DOWN_KEY: String = "move_down" 

## Player's input mapped according to [member player_type].
var input_dict: Dictionary[String, String] = {}


func _ready() -> void:
	match player_type:
		PongEnums.PlayerType.PLAYER_ONE:
			set_input_dict("move_up_1", "move_down_1")
		PongEnums.PlayerType.PLAYER_TWO:
			set_input_dict("move_up_2", "move_down_2")


func _physics_process(delta: float) -> void:
	var distance: float = movement_speed * delta
	
	if Input.is_action_pressed(input_dict[MOVE_UP_KEY]):
		position.y -= distance
	elif Input.is_action_pressed(input_dict[MOVE_DOWN_KEY]):
		position.y += distance


## Maps [member input_dict] to specified values.[br]
## [param move_up_value]: the [String] value corresponding to
## [member MOVE_UP_KEY] in [member input_dict].[br]
## [param move_down_value]: the [String] value corresponding to
## [member MOVE_DOWN_KEY] in [member input_dict].
func set_input_dict(move_up_value: String, move_down_value: String) -> void:
	input_dict.set(MOVE_UP_KEY, move_up_value)
	input_dict.set(MOVE_DOWN_KEY, move_down_value)
