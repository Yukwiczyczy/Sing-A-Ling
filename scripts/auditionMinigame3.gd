extends Node2D

onready var display = $randomKeys
onready var mess = $message
onready var chanceT = $message2
#unnecessary
#recycle copy of code
var combinations = ["q", "w", "e", "r", "t", "y"]
var userInput = ""
var display_text = ""
var chance = 1

#songs
onready var songs = [
	$AudioStreamPlayer2D,
	$AudioStreamPlayer2D2
]

var playingSong
var songI
var songTitle = ""
func _ready():
	songI = randi() % songs.size()
	playingSong = songs[songI]
	playingSong.play()
	print(playingSong)
	randomize()
	if songI == 0:
		songTitle = "pantropiko"
	else:
		songTitle = "salamin salamin"
	display_combinations()
	var inputField = LineEdit.new()
	inputField.set_anchor(MARGIN_TOP, 0.5)
	inputField.set_anchor(MARGIN_RIGHT, 0.5)
	inputField.rect_min_size = Vector2(715, 50)
	inputField.rect_position = Vector2(155, 270)

	var style = StyleBoxFlat.new()
	style.set_default_margin(MARGIN_LEFT, 4)
	style.set_default_margin(MARGIN_TOP, 4)
	style.set_default_margin(MARGIN_RIGHT, 4)
	style.set_default_margin(MARGIN_BOTTOM, 4)
	style.set_bg_color(Color(0, 0, 0, 0))
	style.set_border_width_all(0)

	var font = DynamicFont.new()
	font.font_data = load("res://path_to_your_font.ttf")
	font.size = 32

	inputField.add_stylebox_override("normal", style)
	inputField.add_font_override("font", font)
	inputField.add_color_override("font_color", Color(0, 0, 0))  # Set font color to black

	var dynamicFont = DynamicFont.new()
	dynamicFont.font_data = load("res://assets/font/early_gameboy/Early GameBoy.ttf")
	dynamicFont.size = 32

	inputField.add_font_override("font", dynamicFont)

	inputField.connect("text_entered", self, "_on_input_entered")
	self.add_child(inputField)
	inputField.grab_focus()
	
	

func _on_input_entered(text):
	userInput = text
	if mess.text == "Not Match" or mess.text == "":
		chance -= 1

func _physics_process(delta):
	#print (userInput + " " + display_text)
	print(songI)

		
	
	chanceT.text = "Chance Left: " + str(chance) 
	mess.clear()
	
	if chance <= 0:
		chance = 0
	
	if userInput == "":
		mess.add_text("")
	elif songTitle == userInput:
		mess.push_color(Color(0, 1, 0, 1)) # Green
		mess.add_text("Match")
		chance = 0
		display.text = songTitle
		display.show()
		
	else:
		mess.push_color(Color(0.5, 0, 0, 1)) # Dark red
		mess.add_text("Not Match")
		chance = 0
		display.text = songTitle
		display.show()
		

func display_combinations():
	
	for i in range(combinations.size()):
		#display_text += combinations[randi() % combinations.size()]
		pass
	

func _on_exit_pressed():
	if songTitle == userInput:
		Ui.passedTitle = 1
	else:
		Ui.passedTitle = -1
	
	get_tree().change_scene("res://insideAudition3.tscn")
	pass # Replace with function body.
