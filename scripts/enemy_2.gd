extends Node2D

@onready var timer: Timer = $Timer
@export var speed = 180

@export var switch_time = 5
@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D

var direction = 1
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	timer.wait_time = switch_time


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	position.x += direction * speed * delta


func _on_timer_timeout() -> void:
	if direction == 1:
		direction = -1
		animated_sprite.flip_h = true
	else: 
		direction = 1
		animated_sprite.flip_h = false
