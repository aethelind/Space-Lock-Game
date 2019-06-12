extends Area2D

var vel = Vector2()
export var speed = 900
export var damage = 10
var target

func _ready():
	target = get_global_mouse_position()
	vel = -(position - target).normalized()
	set_process(true)


func start_at(dir, pos):
	#vel = Vector2(speed, 0).rotated(dir)
	pass

func _process(delta):
	position += vel*20

# checks if its entered a friend or foe
# the entity names change but seem to always include their name somehow so I use String.find
func _on_Projectile_body_entered(body):
	if body.name.find('enemy') != -1:
		body.damage()
		queue_free()
	elif body.name.find('alien') != -1:
		body.damage()
		queue_free()
		return
	pass # Replace with function body.


func _on_VisibilityNotifier2D_screen_exited():
	queue_free()
