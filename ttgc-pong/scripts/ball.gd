class_name PongBall
extends Node2D

@export var ballSprite: Sprite2D # The Sprite2D node representing the ball. 
@export var allSprites: Array[Texture2D] # All available sprites for the ball.

@export var ball_rigidbody: RigidBody2D

var total_sprites: int


func _ready() -> void:
	total_sprites = allSprites.size()


func _randomize_ball_sprite() -> void:
	ballSprite.texture = allSprites[randi_range(0, total_sprites)]
	
