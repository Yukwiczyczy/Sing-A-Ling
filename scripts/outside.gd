extends Node2D

var enterCol = 0
var enterHouse = 1

func _physics_process(delta):
	Ui.bottomText = ""
	print ("Entered Collision: ", enterCol)
	if enterCol == -1:
		Ui.bottomText = "Press enter to go inside"
		Ui.bottomText2 = "Ling's House"
		if Input.is_action_just_pressed("enter"):
			get_tree().change_scene("res://insideHouse.tscn")
	elif enterCol == 3:
		Ui.bottomText = "Press enter to go inside"
		Ui.bottomText2 = "Vocal Studio"
		if Input.is_action_just_pressed("enter"):
			get_tree().change_scene("res://insideVocalStudio.tscn")
	elif enterCol == 4:
		Ui.bottomText = "Press enter to go inside."
		Ui.bottomText2 = "Instrument Studio"
		if Input.is_action_just_pressed("enter"):
			get_tree().change_scene("res://insideInstrumentStudio.tscn")
	elif enterCol == 5:
		Ui.bottomText = "Press enter to go to the city"
		Ui.bottomText2 = "Metro Manila"
		if Input.is_action_just_pressed("enter"):
			get_tree().change_scene("res://goCityAnimation.tscn")
	else:
		Ui.bottomText2 = ""

#change the value of enterHouse when collide to the house

func _ready():
	enterCol = 1

func _on_enterhouse_body_entered(body: PhysicsBody2D):
	
	enterCol -= 1
	pass # Replace with function body.


func _on_enterhouse_body_exited(body: PhysicsBody2D):
	Ui.bottomText = ""
	enterCol = 0

func _on_enterVocal_body_entered(body: PhysicsBody2D):
	
	enterCol = 3




func _on_enterVocal_body_exited(body: PhysicsBody2D):
	enterCol = 0
	Ui.bottomText = ""



func _on_enterInstrument_body_entered(body: PhysicsBody2D):	
	
	enterCol = 4




func _on_enterInstrument_body_exited(body: PhysicsBody2D):
	Ui.bottomText = ""
	enterCol = 0



func _on_leave_body_entered(body):
	
	enterCol = 5



func _on_leave_body_exited(body):
	enterCol = 0
	Ui.bottomText = ""




