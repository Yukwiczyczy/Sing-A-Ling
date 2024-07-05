extends Node2D

var enterCol = 0

onready var rect = $ColorRect
onready var rect2 = $ColorRect2
onready var rect3 = $ColorRect3

onready var applause = $applause
onready var fewApplause = $fewApplause
onready var instruction = $YSort/ling/Camera2D/Ui/instruction
onready var instruction2 = $YSort/ling/Camera2D/Ui/instruction2
onready var instruction3 = $YSort/ling/Camera2D/Ui/instruction3

var openInstruction = 1
var openInstruction2 = 1
var openInstruction3 = 1
var closeInstruction = 0
var closeInstruction2 = 0
var closeInstruction3 = 0


func _physics_process(delta):
	if openInstruction == 0:
		instruction.show()
	else:
		instruction.hide()
		
	if openInstruction2 == 0:
		instruction2.show()
	else:
		instruction2.hide()
		
	if openInstruction3 == 0:
		instruction3.show()
	else:
		instruction3.hide()
		
	if Ui.passedGuitar == 1 and Ui.passedPiano == 1 and Ui.passedTitle == 1:
		Ui.music = 1
		
		fewApplause.stop()
	else:
		Ui.music = 0
		applause.stop()
		
	
	if enterCol == -99:
		Ui.bottomText = "Exit the audition"
		Ui.bottomText2 = "Audition Building "
		if Input.is_action_just_pressed("enter"):
			if (Ui.passedGuitar == 1 and Ui.passedPiano == 1 and Ui.passedTitle == 1):
				get_tree().change_scene("res://transitionScene5.tscn")
				pass
			else: 
				get_tree().change_scene("res://transitionSceneFailed.tscn")
	elif enterCol == 1 and Ui.passedGuitar == 0:
		Ui.bottomText = "Please enter to proceed to minigame Guitar"
		Ui.bottomText2 = "Audition"
		if Input.is_action_just_pressed("enter"):
			get_tree().change_scene("res://auditionMinigame2.tscn")
			pass
		pass
	elif enterCol == 1 and Ui.passedGuitar == 1:
		Ui.bottomText = "Congrats! You passed this"
	elif enterCol == 1 and Ui.passedGuitar == -1:
		Ui.bottomText = "Sorry, You have failed this"
	elif enterCol == 2 and Ui.passedPiano == 0:
		Ui.bottomText = "Please enter to proceed to minigame Piano Key"
		Ui.bottomText2 = "Audition"
		if Input.is_action_just_pressed("enter"):
			get_tree().change_scene("res://auditionMiniGame1.tscn")
			pass
		pass
	elif enterCol == 2 and Ui.passedPiano == 1:
		Ui.bottomText = "Congrats! You passed this"
	elif enterCol == 2 and Ui.passedPiano == -1:
		Ui.bottomText = "Sorry, You have failed this"
	elif enterCol == 3 and Ui.passedTitle == 0:
		Ui.bottomText = "Please enter to proceed to 'Guess the Title'"
		Ui.bottomText2 = "Audition"
		if Input.is_action_just_pressed("enter"):
			get_tree().change_scene("res://auditionMinigame3.tscn")
			pass
		pass
	elif enterCol == 3 and Ui.passedTitle == 1:
		Ui.bottomText = "Congrats! You passed this"
	elif enterCol == 3 and Ui.passedTitle == -1:
		Ui.bottomText = "Sorry, You have failed this"
	elif Ui.passedTitle == 1 and Ui.passedPiano == 1 and Ui.passedGuitar == 1:
		Ui.bottomText = "Judges: Congratulations! You have passed the audition."
	else:
		Ui.bottomText = ""
		Ui.bottomText2 = ""
	if Ui.music == 0: 
		fewApplause.playing
	else: 
		applause.playing
	if Ui.passedGuitar == 1:
		rect3.color = Color.darkgreen
	elif Ui.passedGuitar == -1:
		rect3.color = Color.darkred
	else:
		rect3.color = Color.darkgray
		
	if Ui.passedPiano == 1:
		rect2.color = Color.darkgreen
	elif Ui.passedPiano == -1:
		rect2.color = Color.darkred
	else:
		rect2.color = Color.darkgray

	if Ui.passedTitle == 1:
		rect.color = Color.darkgreen
	elif Ui.passedTitle == -1:
		rect.color = Color.darkred
	else:
		rect.color = Color.darkgray
#exiting the audition
func _on_exit_body_entered(body):
	enterCol -= 99
	pass # Replace with function body.

func _on_exit_body_exited(body):
	enterCol = 0
	pass # Replace with function body.


func _on_Guitar_body_entered(body):
	enterCol = 1
	pass # Replace with function body.


func _on_Piano_Keys_body_entered(body):
	enterCol = 2
	pass # Replace with function body.


func _on_Fill_in_the_blank_body_entered(body):
	enterCol = 3
	pass # Replace with function body.


func _on_Guitar_body_exited(body):
	enterCol = 0
	pass # Replace with function body.


func _on_Piano_Keys_body_exited(body):
	enterCol = 0
	pass # Replace with function body.


func _on_Fill_in_the_blank_body_exited(body):
	enterCol = 0
	pass # Replace with function body.


func _on_help_pressed():
	closeInstruction = 1
	if openInstruction == 1:
		openInstruction = 0
	pass # Replace with function body.


func _on_help2_pressed():
	closeInstruction2 = 1
	if openInstruction2 == 1:
		openInstruction2 = 0
	pass # Replace with function body.


func _on_help3_pressed():
	closeInstruction3 = 1
	if openInstruction3 == 1:
		openInstruction3 = 0
	pass # Replace with function body.


func _on_close_pressed():
	openInstruction = 1
	if closeInstruction == 1:
		closeInstruction = 0
	pass # Replace with function body.


func _on_close2_pressed():
	openInstruction2 = 1
	if closeInstruction2 == 1:
		closeInstruction2 = 0
	pass # Replace with function body.


func _on_close3_pressed():
	openInstruction3 = 1
	if closeInstruction3 == 1:
		closeInstruction3 = 0
	pass # Replace with function body.
