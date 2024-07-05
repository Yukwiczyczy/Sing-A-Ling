extends Node2D

var random 
var random2
onready var coachDialog1 = $environment/player/ling/Camera2D/Ui/coach1
onready var coachDialog2 = $environment/player/ling/Camera2D/Ui/coach2
onready var coachComs1 = $environment/coaches/coach1/AnimatedSprite
onready var coachComs2 = $environment/coaches/coach2/AnimatedSprite
onready var coms1 = $environment/coaches/coach1/coms
onready var coms2 = $environment/coaches/coach2/coms
onready var instruction = $environment/player/ling/Camera2D/Ui/instruction
onready var instruction2 = $environment/player/ling/Camera2D/Ui/instruction2

var enterCol = -99

var close = 0
var enter = 1
var close2 = 0
var enter2 = 1

func _ready():
	instruction.hide()
	coms1.hide()
	coms2.hide()
	coachDialog1.hide()
	coachDialog2.hide()
	coachComs2.play("default")

func _physics_process(delta):
	Ui.bottomText = ""
	enterCol += 0
	random = randi() % 70
	random2 = randi() % 20
	#print(random)
	#print(enterCol)
	
	if enter == 0:
		instruction.show()
	else: 
		instruction.hide()
		
	if enter2 == 0:
		instruction2.show()
	else:
		instruction2.hide()
	
	if enterCol == -99:
		Ui.bottomText = "Press enter to exit"
		Ui.bottomText2 = "Instrument Studio"
		if Input.is_action_just_pressed("enter"):
			get_tree().change_scene("res://outsideInstrument.tscn")
	elif enterCol == 2:
		coms2.show()
		coachDialog2.show()
		Ui.bottomText2 = "Shania"
		if Ui.restValue > 49 and Ui.instrumentGuitarSes != 0: 
			Ui.bottomText = "Press enter to start the session"
			Ui.bottomText3 = "Available Session: " + str(Ui.instrumentGuitarSes)
			if Input.is_action_just_pressed("enter"):
				get_tree().change_scene("res://thirdMinigame.tscn")
		elif Ui.instrumentGuitarSes == 0:
			Ui.bottomText = "Congratulation! You already completed this session"
		else:
			Ui.bottomText = "You need to take some rest"
			if Input.is_action_just_pressed("enter"):
				Ui.expValue += 0
					
	elif enterCol == 3:
		coms1.show()
		coachDialog1.show()
		coachComs1.play("talking")
		Ui.bottomText2 = "SunJae"
		if Ui.restValue > 49 and (Ui.instrumentPianoSes != 0):
			Ui.bottomText = "Press enter to start the session"
			Ui.bottomText3 = "Available Session: " + str(Ui.instrumentPianoSes)
			if Input.is_action_just_pressed("enter"):
				get_tree().change_scene("res://secondMiniGame.tscn")
		elif Ui.instrumentPianoSes == 0:
			Ui.bottomText = "Congratulation! You already completed this session"
		else:
			Ui.bottomText = "You need to take some rest"
			if Input.is_action_just_pressed("enter"):
				Ui.expValue += 0

	else:
		coms2.hide()
		coachDialog2.hide()
		coms1.hide()
		coachComs1.play("default")
		coachDialog1.hide()
		Ui.bottomText = ""
		Ui.bottomText2 = ""
		Ui.bottomText3 = ""



func _on_exitStudioInstrument_body_entered(body: PhysicsBody2D):
	enterCol -= 99



func _on_exitStudioInstrument_body_exited(body: PhysicsBody2D):
	enterCol = 0



func _on_guitarSession_body_entered(body: PhysicsBody2D):
	enterCol += 3
	pass # Replace with function body.


func _on_guitarSession_body_exited(body: PhysicsBody2D):
	
	enterCol = 0
	pass # Replace with function body.


func _on_pianoSession2_body_entered(body: PhysicsBody2D):
	enterCol += 2
	pass # Replace with function body.


func _on_pianoSession2_body_exited(body: PhysicsBody2D):
	enterCol = 0
	pass # Replace with function body.


func _on_TextureButton_pressed():
	close = 1
	if enter == 1:
		enter = 0
	pass # Replace with function body.


func _on_close_pressed():
	enter = 1
	if close == 1:
		close = 0
	pass # Replace with function body.


func _on_TextureButton2_pressed():
	close2 = 1
	if enter2 == 1:
		enter2 = 0
	pass # Replace with function body.


func _on_close2_pressed():
	enter2 = 1
	if close2 == 1:
		close2 = 0
	pass # Replace with function body.
