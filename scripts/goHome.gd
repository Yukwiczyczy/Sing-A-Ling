extends Area2D

var goHome = false
var enterCol = 0

func _ready():
	print ("Go Home state: ", goHome)

func _physics_process(delta):
	if goHome == true && enterCol != 0:
		if Input.is_action_just_pressed("enter"):
			get_tree().change_scene("res://outsideCity.tscn")

func _on_goHome_body_entered(body):
	goHome = true
	print("Go home: ", goHome)

func _on_goHome_body_exited(body):
	goHome = false
	enterCol -= 1
	print("Go home: ", goHome)
