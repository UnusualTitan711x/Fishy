extends Node

@onready var jump: AudioStreamPlayer2D = $"../Player/jump"
@onready var coin: AudioStreamPlayer2D = $"../Player/coin"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func play_coin():
	coin.play()

func play_jump():
	jump.play()
