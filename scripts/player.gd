extends CharacterBody2D
class_name Player

@export var SPEED = 300.0
@export var JUMP_VELOCITY = 400.0
@export var gravity_scale : float = 2
@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D
@onready var game_manager: Node = %GameManager

var coins = 0

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * gravity_scale * delta

	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		game_manager.play_jump()
		velocity.y -= JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("move_left", "move_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	if direction > 0:
		animated_sprite.flip_h = false
	elif direction < 0:
		animated_sprite.flip_h = true
		
	if is_on_floor():
		if direction == 0:
			animated_sprite.play("idle")
		else:
			animated_sprite.play("walk")
	else:
		animated_sprite.play("jump")

	move_and_slide()
