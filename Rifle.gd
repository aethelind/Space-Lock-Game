extends Sprite

const projectile = preload("Projectile.tscn")


func _process(delta):
	look_at(get_global_mouse_position())
#	if Input.is_action_just_pressed('shoot'):
#		_shoot()
	pass
#
#sync func _shoot():
#	var bullet = projectile.instance()
#	add_child(bullet)
#
#	bullet.start_at(0, get_global_mouse_position())
#
#	#bullet.
#	pass