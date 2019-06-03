extends Node2D

# spawns debris 


const UP = Vector2(0,-1)
# first, reference scene with debris we want to instantiate.
const enemy = preload("enemy.tscn")


func _ready():
	spawn()
	pass 


func spawn():
	while true:
		randomize()
		# create debris and set random spawn point:
		var debris = enemy.instance()
		debris.velocity.x = rand_range(-300,-100)
		debris.velocity.y = rand_range(-300,300)
		var pos = Vector2()
		
		# x position is fixed at just to the right of screen
		pos.x = get_viewport().get_visible_rect().size.x+64
		#y pos is random from top to bottom within margin
		pos.y = rand_range(0+64,get_viewport().get_visible_rect().size.y-64)
		
		# set position and add it to scene
		debris.position = pos
		get_node("container").add_child(debris)
		yield(get_tree().create_timer(rand_range(1, 4)), "timeout")
	
	pass