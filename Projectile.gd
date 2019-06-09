extends Area2D

var vel = Vector2()
export var speed = 1000
export var damage = 10

func _ready():
	set_process(true)


func start_at(dir, pos):
	rotation = dir
	position = pos
	vel = Vector2(speed, 0).rotated(dir)

func _process(delta):
	translate(vel * delta)
	pass

func _on_Projectile_body_entered(body):
	if body.name == ('enemy'):
		print("shot debris")
		#body.damage(damage)
		queue_free()
		return
	pass # Replace with function body.


func _on_VisibilityNotifier2D_screen_exited():
	queue_free()
