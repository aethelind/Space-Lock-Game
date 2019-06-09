extends Sprite

const projectile = preload("Projectile.tscn")

func _process(delta):
	look_at(get_global_mouse_position())
	if Input.is_action_pressed('shoot'):
		print("wowza")
		_shoot()
	pass

sync func _shoot():
	print("in _shoot")
	var bullet = projectile.instance()
	add_child(bullet)
	#bullet.
	pass