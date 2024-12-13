extends Node3D
@export var coin_scene : PackedScene
var coin_instance : Area3D
var do_once : bool
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	spawn_coin()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if coin_instance == null and not do_once:
		do_once = true
		await get_tree().create_timer(2).timeout
		spawn_coin()

func spawn_coin() -> void:
	coin_instance = coin_scene.instantiate()
	add_child(coin_instance)
	coin_instance.position = Vector3.ZERO
	do_once = false
