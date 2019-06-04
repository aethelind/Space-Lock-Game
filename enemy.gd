extends KinematicBody2D
# enemy script

export var velocity = Vector2()
const UP = Vector2(0,-1)
const BONK = 200
const SPEED = 200



func _ready():
	set_process(true)
	pass 

func _physics_process(delta):
	# moves @ some velocity every frame
	translate(velocity * delta)
	
	# once it exits the frame, it is destroyed
	if get_position().y-64 >= get_viewport_rect().size.y:
		queue_free()
	
	if is_on_floor():
		velocity.y = -BONK
	elif is_on_ceiling():
		velocity.y = BONK

	velocity.x = -SPEED
	velocity = move_and_slide(velocity, UP)
	pass