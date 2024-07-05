extends Node2D

var enterCol = 0
var randomValue
onready var coach = $interior/coach/AnimatedSprite
onready var coms = $interior/coach/AnimatedSprite/coms
onready var dialog = $interior/player/ling/Camera2D/Ui/coachDialog
onready var instruction = $interior/player/ling/Camera2D/Ui/instruction

var instructOpen = 1
var closeInstruct = 0

func _ready():
	instruction.hide()
	dialog.hide()
	coms.hide()
	enterCol = 0

func _physics_process(delta):
	
	if instructOpen == 0:
		instruction.show()
	else:
		instruction.hide()
	
	if enterCol == 1:
		
		dialog.show()
		coms.show()
		coms.play("default")
		Ui.bottomText2 = "Prince"
		if Ui.restValue >=80 and Ui.instrumentGuitarSes == 0 and Ui.instrumentPianoSes == 0 and Ui.vocalSession != 0:
			Ui.bottomText3 = "Available Session: " + str(Ui.vocalSession)
			Ui.bottomText = "Press enter to start the session"
			if Input.is_action_just_pressed("enter"):
				get_tree().change_scene("res://firstMiniGame.tscn")
		elif Ui.instrumentGuitarSes == 2 and Ui.instrumentPianoSes ==2:
			Ui.bottomText = "To proceed to this session, finish the instrument studio sessions"
		elif Ui.restValue >= 50 and Ui.instrumentGuitarSes != 0 or Ui.instrumentPianoSes != 0:
			Ui.bottomText = "You still need to finish the instrument studio sessions"
		elif Ui.vocalSession == 0:
			Ui.bottomText = "Congratulation! You have already finished this session"
		else:
			Ui.bottomText = "You need some rest before starting this session"
	elif enterCol == 2:
		Ui.bottomText = "Press enter to exit"
		Ui.bottomText2 = "Vocal Studio"
		if Input.is_action_just_pressed("enter"):
			get_tree().change_scene("res://outsideVocal.tscn")
	
	else:
		Ui.bottomText2 = ""
		Ui.bottomText3 = ""
		coach.play("default")
		coms.hide()
		dialog.hide()

func _on_outsideVocal_body_entered(body: PhysicsBody2D):
	enterCol = 2

	pass # Replace with function body.


func _on_outsideVocal_body_exited(body: PhysicsBody2D):
	enterCol = 0
	Ui.bottomText = ""
	pass # Replace with function body.

#handle the experience gaining to the voal
func _on_gainExp_body_entered(body: PhysicsBody2D):
	enterCol += 1
	pass # Replace with function body.

func _on_gainExp_body_exited(body: PhysicsBody2D):
	Ui.bottomText = ""
	enterCol = 0
	pass # Replace with function body.

func _on_help_pressed():
	closeInstruct = 1
	if instructOpen == 1:
		instructOpen = 0
	pass # Replace with function body.


func _on_close_pressed():
	instructOpen = 1
	if closeInstruct == 1:
		closeInstruct = 0
	pass # Replace with function body.
