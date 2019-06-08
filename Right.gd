extends Area2D

# losing
func _process(delta):
	var bodies = get_overlapping_bodies()
	for b in bodies:
		if b.name == "enemy":
			print("h")