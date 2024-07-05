extends Node2D

onready var bar_position = $ProgressBar
onready var chanceT = $chanceText
onready var message = $Message
onready var voice = $voice
onready var exitMG = $exit

onready var sound =$doSound
onready var sound2 =$reSound
onready var sound3 =$miSound
onready var sound4 =$faSound
var finalSound

var bar_speed = 1
var is_moving_up = true
var is_movement_disabled = false
var chance = 3
var word_list = ["do", "re", "mi", "fa"]
var random_voice
var randomMatch = ""
var pause = 1
var play

func _ready():
	exitMG.hide()
	Ui.activateV = true
	random_voice = word_list[randi() % word_list.size()]
	voice.text = random_voice
	
func _process(delta):
	voice.text = random_voice
	if Ui.activateV:
		pass
	chanceT.text = "Chance Left: " + str(chance)
	if is_moving_up and not is_movement_disabled and chance > 0:
		bar_position.value += bar_speed
	elif not is_moving_up and not is_movement_disabled and chance > 0:
		bar_position.value -= bar_speed
	
	if bar_position.value == 100:
		is_moving_up = false
	elif bar_position.value <= 0:
		is_moving_up = true
		
	if chance < 0:
		chance = 0
	elif chance == 0:
		exitMG.show()
	
	if bar_position.value > 3 && bar_position.value < 28:
		randomMatch = "do"
		finalSound = sound
	elif bar_position.value < 48 && bar_position.value > 36:
		randomMatch = "re"
		finalSound = sound2
	elif bar_position.value < 70 && bar_position.value > 58:
		randomMatch = "mi"
		finalSound = sound3
	elif bar_position.value < 92 && bar_position.value > 80:
		randomMatch = "fa"
		finalSound = sound4

		
func _on_play_pressed():
	finalSound.stop()
	if play ==1:
		play = 0
		pause = 1
	
	if is_movement_disabled:
		is_movement_disabled = false
		
	pass # Replace with function body.


func _on_pause_pressed():
	print(finalSound)
	finalSound.play()
	is_movement_disabled = true
	if random_voice == randomMatch:
		chance = 0
		message.text = "Excellent!"
		exitMG.show()
	else:
		message.text = "Missed! Try again."
		exitMG.hide()
		
	if pause == 1:
		play = 1
		pause = 0
		chance -= 1
	
	pass # Replace with function body.


func _on_exit_pressed():
	if random_voice == randomMatch:
		Ui.vocalSession -= 1
		Ui.expValue += 20

	Ui.restValue -= 50
	get_tree().change_scene("res://insideVocalStudio2.tscn")
	pass # Replace with function body.
