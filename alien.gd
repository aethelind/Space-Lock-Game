extends KinematicBody2D

# alien script

export var velocity = Vector2()
const UP = Vector2(0,-1)
const BONK = 200
const SPEED = 200
var r = 0
var r_delta = 0
export var r_dir = 1

const animation = ["beige", "blue", "pink", "yellow"]

func _ready():
	set_process(true)
	pass 

func _physics_process(delta):
	for i in get_slide_count():
		var collision = get_slide_collision(i)
		if collision.collider.name == "Player":
			queue_free()
	# moves @ some velocity every frame
	translate(velocity * delta)
	
	# once it exits the frame, it is destroyed
	if get_position().y-64 >= get_viewport_rect().size.y:
		queue_free()
	
	if is_on_floor():
		velocity.y = -BONK
		r_dir = -r_dir
	elif is_on_ceiling():
		velocity.y = BONK
		r_dir = -r_dir

	velocity.x = -SPEED
	
	# add a rotation
	r_delta = 2 * r_dir
	
	r=(r+r_delta)%360
	set_rotation_degrees(r)
	
	velocity = move_and_slide(velocity, UP)
	pass


func damage():
	# you shot your friend, some repurcussion
	queue_free()
	pass


func rand_anim():
	$Sprite.play(animation[rand_range(0,4)])
	pass