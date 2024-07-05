extends Area2D

var exitCity = false
var enterCol = 0

func _ready():
	enterCol = 0

func _physics_process(delta):
	print ("exitCity? ", exitCity, enterCol)
	if exitCity == true && (enterCol != 0):
		if Input.is_action_just_pressed("enter"):
			get_tree().change_scene("res://world/outside.tscn")


func _on_exitCity_body_entered(body):
	exitCity = true
	print(exitCity)


func _on_exitCity_body_exited(body):
	exitCity = false
	enterCol -= 1
	print(exitCity)
