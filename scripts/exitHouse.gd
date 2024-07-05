extends Area2D

var exitedHouse = 0

#When exiting House
func _on_exitHouse_body_entered(body: PhysicsBody2D):
	exitedHouse = 1

func _on_exitHouse_body_exited(body: PhysicsBody2D):
	exitedHouse = 0
	
func _physics_process(delta):
	if exitedHouse == 1:
		if Input.is_action_just_pressed("enter"):
			get_tree().change_scene("res://outside.tscn")
