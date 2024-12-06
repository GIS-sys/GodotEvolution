extends Node2D

var circle_scene: PackedScene
var spawn_interval: float = 3.0
var spawn_timer: float = 0.0

func _ready():
	# Load the Circle scene
	circle_scene = preload("res://circle.tscn")

func _process(delta):
	spawn_timer -= delta
	if spawn_timer <= 0:
		spawn_random_circle()
		spawn_timer = spawn_interval

func spawn_random_circle():
	var circle = circle_scene.instantiate()
	circle.position = Vector2(randf_range(0, get_viewport().size.x), randf_range(0, get_viewport().size.y))
	circle.mass = randf_range(1.0, 5.0)     # Random weight between 1 and 5
	circle.radius = randf_range(10, 30)      # Random radius between 10 and 30
	spawn_circle(circle)

func spawn_circle(circle):
	add_child(circle)
