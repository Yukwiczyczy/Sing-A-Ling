extends Node2D

onready var display = $randomKeys
onready var mess = $message
onready var chanceT = $message2
var combinations = ["q", "w", "e", "r", "t", "y"]
var userInput = ""
var display_text = ""
var chance = 3

func _ready():
	randomize()
	display_combinations()
	var inputField = LineEdit.new()
	inputField.set_anchor(MARGIN_TOP, 0.5)
	inputField.set_anchor(MARGIN_RIGHT, 0.5)
	inputField.rect_min_size = Vector2(715, 50)
	inputField.rect_position = Vector2(385, 180)

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
	print (userInput + " " + display_text)
	chanceT.text = "Chance Left: " + str(chance) 
	mess.clear()
	
	if chance <= 0:
		chance = 0
	
	if userInput == "":
		mess.add_text("")
	elif display_text == userInput:
		mess.push_color(Color(0, 1, 0, 1)) # Green
		mess.add_text("Match")
		chance = 0
	else:
		mess.push_color(Color(0.5, 0, 0, 1)) # Dark red
		mess.add_text("Not Match")
		

func display_combinations():
	
	for i in range(combinations.size()):
		display_text += combinations[randi() % combinations.size()]

	display.text = display_text
	yield(get_tree().create_timer(2.0), "timeout") # Change the timeout duration here if needed

	display.clear()
	

func _on_exit_pressed():
	if display_text == userInput:
		Ui.expValue +=10
		Ui.restValue -= 15
		Ui.instrumentPianoSes -= 1
	else:
		Ui.restValue -= 15
	
	get_tree().change_scene("res://insideInstrumentStudio3.tscn")
	pass # Replace with function body.
