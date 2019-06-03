extends KinematicBody2D
# enemy script

export var velocity = Vector2()
const UP = Vector2(0,-1)



func _ready():
	set_process(true)
	pass 

func _physics_process(delta):
	# moves @ some velocity every frame
	#translate(velocity * delta)
	
	# once it exits the frame, it is destroyed
	if get_position().y-64 >= get_viewport_rect().size.y:
		queue_free()
	
	velocity = move_and_slide(velocity, UP)
	pass