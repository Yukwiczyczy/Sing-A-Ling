extends Node2D

onready var display = $randomArrows
onready var mess = $mess
onready var chanceT = $mess2

#key combinations needed
var combinations = ["w", "a", "s", "d"]
var userInput = ""
var display_text = ""
var matchCount = 0
var timer = 25
var innerTimer = 1


func _ready():
	#randomize the text
	randomize()
	

func _physics_process(delta):
	
	#set a timer for the typing and timer for each changes of keys
	if timer > 0:
		timer -= 1 * delta
		innerTimer -= 1 * delta
		if innerTimer <= -2:
			innerTimer = 1
		if int(innerTimer) >= 0:
			for i in range(combinations.size()):
				display_text = combinations[randi() % combinations.size()]

		display.text = display_text
		chanceT.text = "Time Left: " + str(int(timer)) + " Match Keys: " + str(matchCount)
	
	#if timer is lesser than zero; set it to zero
	elif timer < 0:
		timer = 0
	
	#guide for the input of the user if matches the keys
	#print (userInput + " " + display_text)
	
	#clerar the text to remove the loop of text
	mess.clear()
	
	#assign keys for the letter
	if Input.is_action_just_pressed("ui_down"):
		userInput = "s"
	elif Input.is_action_just_pressed("ui_up"):
		userInput = "w"
	elif Input.is_action_just_pressed("ui_left"):
		userInput = "a"
	elif Input.is_action_just_pressed("ui_right"):
		userInput = "d"
	else:
		userInput = ""
		

	if display_text == userInput and int(innerTimer) <= 0:
		mess.push_color(Color(0, 1, 0, 1)) # Green
		mess.add_text("Match")
		matchCount += 1
	elif display_text != userInput and int(innerTimer) <= 0 and userInput != "":
		mess.push_color(Color(0.5, 0, 0, 1)) # Dark red
		mess.add_text("Not Match")
		matchCount -= .5
	elif userInput != ""  and int(innerTimer) == 0:
		mess.push_color(Color(0.5, 0, 0, 1)) # Dark red
		mess.add_text("")
	elif timer == 0:
		mess.push_color(Color(0.5, 0, 0, 1)) # Dark red
		mess.add_text("Times up")
		

func display_combinations():
	
	#random combination from the array
	for i in range(combinations.size()):
		display_text = combinations[randi() % combinations.size()]

	display.text = display_text
	


func _on_TextureButton_pressed():
	#declare if the player pass the minigame
	if matchCount > 4:
		Ui.passedPiano = 1 
	else:
		Ui.passedPiano = -1 
	get_tree().change_scene("res://insideAudition2.tscn")
	pass # Replace with function body.
