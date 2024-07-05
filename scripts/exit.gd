extends Area2D


var exited = false

func _on_exit_body_entered(body: PhysicsBody2D):
	exited = true
	print(exited)

func _on_exit_body_exited(body: PhysicsBody2D):
	exited = false
	print(exited)

func _physics_process(delta):
	if exited == true:
		if Input.is_action_just_pressed("ui_up"):
			get_tree().change_scene("res://world/outside.tscn")
