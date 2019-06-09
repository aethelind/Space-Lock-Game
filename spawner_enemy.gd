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
		
		# give debris a random non-zero rotation
		debris.r_dir = int(rand_range(-3,3))
		while(debris.r_dir == 0):
			debris.r_dir = int(rand_range(-3,3))
		
		# make random scaled size
		var sc1 = rand_range(0.2, 1)
		var sc2 = rand_range(0.2, 1)
		var sh = debris.get_node("shape")
		var sp = debris.get_node("sprite")
		sh.set_scale(Vector2(sc1,sc2))
		sp.set_scale(Vector2(sc1,sc2))
		
		var pos = Vector2()
		# x position is fixed at just to the right of screen
		pos.x = get_viewport().get_visible_rect().size.x
		#y pos is random from top to bottom within margin
		pos.y = rand_range(0+64,get_viewport().get_visible_rect().size.y-64)
		
		# set position and add it to scene
		debris.position = pos
		get_node("container").add_child(debris)
		yield(get_tree().create_timer(rand_range(0.25, 1.5)), "timeout")
	
	pass