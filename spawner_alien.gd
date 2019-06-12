extends Node2D

# spawns other aliens to save

const UP = Vector2(0,-1)
# first, reference scene with debris we want to instantiate.
const alien = preload("alien.tscn")

const rot = [-1, 1]


func _ready():
	#yield(get_tree().create_timer(rand_range(5.0,10.0)), "timeout")
	spawn()
	pass 


func spawn():
	while true:
		randomize()
		# create alien and set random spawn point:
		var friend = alien.instance()
		friend.velocity.x = rand_range(-200,-100)
		friend.velocity.y = rand_range(-200,200)
		friend.rand_anim()
		
		# give debris a random non-zero rotation
		friend.r_dir = rot[rand_range(0,1)]
		
		var pos = Vector2()
		# x position is fixed at just to the right of screen
		pos.x = get_viewport().get_visible_rect().size.x
		#y pos is random from top to bottom within margin
		pos.y = rand_range(0+64,get_viewport().get_visible_rect().size.y-64)
		
		# set position and add it to scene
		friend.position = pos
		get_node("container").add_child(friend)
		
		# shorter timer for testing, but should be longer
		yield(get_tree().create_timer(rand_range(0,2.0)), "timeout")
	
	pass