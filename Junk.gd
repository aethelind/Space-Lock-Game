extends KinematicBody2D

const UP = Vector2(0,-1)

var V_MOTION = 2
var H_MOTION = rand_range(-5, -1.5)
var r = 0
var r_delta = rand_range(1,5)
const BONK = 300

var motion = Vector2()

func _physics_process(delta):
	motion.x += H_MOTION
	motion.y += V_MOTION
	
	# bounce when hitting the walls
	# get pushed in the opposite direction, and in some x direction
	if is_on_floor():
		motion.y = -BONK
		V_MOTION = -V_MOTION
	elif is_on_ceiling():
		motion.y = BONK
		V_MOTION = -V_MOTION
	
	r+=r_delta
	set_rotation_degrees(r)

	
	motion = move_and_slide(motion, UP)
	