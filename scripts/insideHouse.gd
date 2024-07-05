extends Node2D

var randomRest
var colEnter = 0


onready var collision = $limit3


func _physics_process(delta):
	randomRest = randi() % 20 + 1
	if colEnter == -99:
		Ui.bottomText2 = "Ling's House"
		Ui.bottomText = "Press enter to sleep"
		if Ui.restValue < 100:
			if Input.is_action_just_pressed("enter"):
				get_tree().change_scene("res://sleep.tscn")
				
		else:
			Ui.bottomText = "Your energy is full"
	elif colEnter == 2:
		Ui.bottomText2 = "Ling's House"
		Ui.bottomText = "Press enter to exit"
		if Input.is_action_just_pressed("enter"):
			get_tree().change_scene("res://outside.tscn")
	else:
		Ui.bottomText = ""
		Ui.bottomText2 = ""
		



#Entering bedroom
func _on_bedRoom_body_entered(body: PhysicsBody2D):
	colEnter -= 99

func _on_bedRoom_body_exited(body: PhysicsBody2D):
	colEnter = 0
	pass # Replace with function body.

#Exit the house
func _on_exitHouse_body_entered(body):
	colEnter = 2
	pass # Replace with function body.


func _on_exitHouse_body_exited(body):
	colEnter = 0
	pass # Replace with function body.
