class_name PongBall
extends RigidBody2D
## Responsible for the ball's movement, behaviour and visuals.

@export var ball_sprite: Sprite2D ## The current sprite of the ball.

@export var all_sprites: Array[Texture2D] ## All available sprites for the ball.

var total_sprites: int ## Total sprites in [member all_sprites].

var speed: float = 300.0

var allowed_rotation_ranges: Array[AngleRange] = [
	AngleRange.new(15, 45),
	AngleRange.new(135, 165),
	AngleRange.new(195, 225),
	AngleRange.new(315, 345)
]

func _ready() -> void:
	total_sprites = all_sprites.size()
	# Pick an initial random direction for the ball to travel in.
	apply_linear_velocity_in_random_direction()


func _integrate_forces(_state: PhysicsDirectBodyState2D) -> void:
	# Maintain constant speed
	if linear_velocity.length() != 0:
		linear_velocity = linear_velocity.normalized() * speed


## Assign a random [Texture2D] from [member all_sprites] 
## to [member ball_sprite].
func randomize_ball_sprite() -> void:
	ball_sprite.texture = all_sprites[randi_range(0, total_sprites)]
	

func apply_linear_velocity_in_random_direction() -> void:
	var random_index: int = randi() % allowed_rotation_ranges.size()
	var random_radian:float  = allowed_rotation_ranges[random_index].get_random_angle_in_rad()
	randomize()
	linear_velocity = Vector2.DOWN.rotated(random_radian) * speed
