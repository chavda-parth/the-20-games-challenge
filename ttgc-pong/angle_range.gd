class_name AngleRange

var from: float
var to: float


func _init(from_angle: float, to_angle: float) -> void:
	from = from_angle
	to = to_angle


func get_random_angle_in_rad() -> float:
	return deg_to_rad(randf_range(from, to))
