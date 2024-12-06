extends RigidBody2D

var radius: float
var velocity: Vector2

func _ready():
	mass = randf_range(0.2, 1.0)**2 * 1000
	radius = mass
	velocity = Vector2(randf_range(-1, 1), randf_range(-1, 1)).normalized() * mass

func _process(delta):
	#position += direction * speed * delta
	# Check for bounds: if outside of screen boundaries, reverse direction
	if position.x < 0 or position.x > get_viewport().size.x:
		velocity.x = -velocity.x
	if position.y < 0 or position.y > get_viewport().size.y:
		velocity.y = -velocity.y
	var collision = move_and_collide(velocity * delta)
	if collision:
		var body = collision.get_collider()
		var angle = collision.get_angle()
		handle_collision(body, angle)

func handle_collision(body, angle):
	# change speeds
	var t = velocity
	velocity = body.velocity
	body.velocity = t
	# destroy one with the least mass
	if mass > body.mass:
		body.queue_free()  # Remove the lighter circle
	elif mass < body.mass:
		queue_free()  # Remove this circle if it is lighter
