class_name PongBall
extends RigidBody2D
## Responsible for the ball's movement, behaviour and visuals.

@export var ball_sprite: Sprite2D ## The current sprite of the ball.

@export var all_sprites: Array[Texture2D] ## All available sprites for the ball.

var total_sprites: int ## Total sprites in [member all_sprites].


func _ready() -> void:
	total_sprites = all_sprites.size()


## Assign a random [Texture2D] from [member all_sprites] 
## to [member ball_sprite].
func randomize_ball_sprite() -> void:
	ball_sprite.texture = all_sprites[randi_range(0, total_sprites)]
