extends KinematicBody2D

# 0,0 would be a topdown game, so move_and_slide knows which direction is up.
const UP = Vector2(0,-1)
const GRAVITY = 1
const H_GRAVITY = -3
const SPEED = 180
const JUMP = 160
const BONK = 100

var r = 0
var r_delta = 0
var motion = Vector2()

func _process(delta):
	
	motion.y+=GRAVITY
	motion.x+=H_GRAVITY
	
	if Input.is_action_just_pressed("ui_right"):
		motion.x = SPEED
		$Sprite.play("Float")
		$Sprite.flip_h = false
	elif Input.is_action_just_pressed("ui_left"):
		motion.x = -SPEED
		$Sprite.play("Float")
		$Sprite.flip_h = true	
	
	if Input.is_action_just_pressed("ui_up"):
		$Sprite.play("Float")
		motion.y = -JUMP
	if Input.is_action_just_pressed("ui_down"):
		$Sprite.play("Float")
		motion.y = JUMP
	
	# bounce when hitting the walls
	# get pushed in the opposite direction, and in some x direction
	if is_on_floor():
		$Sprite.play("Bonk")
		motion.y = -BONK
		motion.x += rand_range(-100, -50)
	elif is_on_ceiling():
		$Sprite.play("Bonk")
		motion.y = BONK
		motion.x += rand_range(-100, -50)
	elif is_on_wall():
		$Sprite.play("Bonk")
		motion.x = -SPEED
	
	# add a rotation
	if motion.x < 0:
		r_delta = 3
	else:
		r_delta = -3
	
	r+=r_delta
	set_rotation_degrees(r)
	# updates motion when it hits the floor
	motion = move_and_slide(motion, UP)
