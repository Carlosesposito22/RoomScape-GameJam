extends CharacterBody2D
class_name Erick

@export_category("Variables")
@export var _move_speed: float = 64.0
@onready var animated_sprite = $AnimatedSprite2D
@export var _acceleration: float = 0.2
@export var _friction: float = 0.2

func _physics_process(_delta: float) -> void:
	_move()
	move_and_slide()
	
	var direcao = Input.get_axis("move_left", "move_right")
	var direcao2 = Input.get_axis("move_up", "move_down")
	
	if direcao>0:
		animated_sprite.flip_h=false
	elif direcao<0:
		animated_sprite.flip_h=true
	if direcao==0:
		animated_sprite.play("idle")
	else:
		animated_sprite.play("move_right")
		
func _move() -> void:
	var _direction: Vector2 = Vector2(
		Input.get_axis("move_left", "move_right"),
		Input.get_axis("move_up", "move_down")
	)
	
	if _direction != Vector2.ZERO:
		velocity.x = lerp(velocity.x, _direction.normalized().x * _move_speed, _acceleration)
		velocity.y = lerp(velocity.y, _direction.normalized().y * _move_speed, _acceleration)
		return
	velocity.x = lerp(velocity.x, _direction.normalized().x * _move_speed, _friction)
	velocity.y = lerp(velocity.y, _direction.normalized().y * _move_speed, _acceleration)
	
	velocity = _direction.normalized() * _move_speed
	
	


