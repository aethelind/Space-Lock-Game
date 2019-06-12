extends Sprite

const projectile = preload("Projectile.tscn")

func _process(delta):
	look_at(get_global_mouse_position())
	pass
