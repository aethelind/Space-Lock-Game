extends Area2D

func _process(delta):
	# If the player is overlapping with the OOB area, send them to game over screen
	var bodies = get_overlapping_bodies()
	for b in bodies:
		if b.name == "Player":
			get_tree().change_scene("Over.tscn")