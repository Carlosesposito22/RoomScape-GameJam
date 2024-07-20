extends Area2D
class_name portas
var _player_ref: Erick = null

@export_category("Variables")
@export var _teleport_position: Vector2


func _on_body_entered(_body) -> void:
	if _body is Erick:
		_player_ref= _body
		_player_ref.global_position= _teleport_position
	

