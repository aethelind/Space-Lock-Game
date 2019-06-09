extends Area2D

#RHS of screen, don't let player past
func _process(delta):
	var bodies = get_overlapping_bodies()
	for b in bodies:
		if b.name == "Player":
			b.motion.x = -225