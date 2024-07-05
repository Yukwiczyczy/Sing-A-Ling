extends Control

onready var panel = $Panel
onready var panel2 = $Panel2
onready var panel3 = $Panel3
onready var panel4 = $Panel4

onready var ok = $Ok
onready var status = $Status

onready var panelContainers = [
	$PanelContainer,
	$PanelContainer2,
	$PanelContainer3,
	$PanelContainer4,
	$PanelContainer5,
	$PanelContainer6,
	$PanelContainer7,
	$PanelContainer8,
	$PanelContainer9,
	$PanelContainer10,
	$PanelContainer11,
	$PanelContainer12
]

onready var panelText = panelContainers[randi() % 12]
onready var panelText2 = panelContainers[randi() % 12]
onready var panelText3 = panelContainers[randi() % 12]
onready var panelText4 = panelContainers[randi() % 12]

var okText = ""
var okText2 = ""
var okText3 = ""
var okText4 = ""
var verified = false

var timer = 10

func _ready():
	panelText = panelContainers[randi() % 12]
	panelText2 = panelContainers[randi() % 12]
	panelText3 = panelContainers[randi() % 12]
	panelText4 = panelContainers[randi() % 12]

func _physics_process(delta):
	
	timer -= timer * delta
	print (timer)
	
	panel.modulate = Color(1, 0.5, 0.5)  # Light red
	panel2.modulate = Color(0.5, 1, 0.5)  # Light green
	panel3.modulate = Color(1, 1, 0.5)  # Light yellow
	panel4.modulate = Color(0.5, 0.5, 1)  # Light blue
	
	panelText.modulate = Color(1, 0.5, 0.5)  # Light red
	panelText2.modulate = Color(0.5, 1, 0.5)  # Light green
	panelText3.modulate = Color(1, 1, 0.5)  # Light yellow
	panelText4.modulate = Color(0.5, 0.5, 1)  # Light blue
	
	if int(timer) == 0:
		panelText.modulate = Color(1, 1, 1)
		panelText2.modulate = Color(1, 1, 1)
		panelText3.modulate = Color(1, 1, 1)
		panelText4.modulate = Color(1, 1, 1)
		
	if Input.is_action_just_pressed("enter"):
		status.clear()
		#ok.text = "-- " + okText + " -- " + okText2 + " -- " + okText3 +  "-- " + okText4 + " --"
		#if (panel.rect_global_position.distance_to(panelText.rect_global_position) < panelText.rect_scale.x) and (panel2.rect_global_position.distance_to(panelText2.rect_global_position) < panelText2.rect_scale.x) and (panel3.rect_global_position.distance_to(panelText3.rect_global_position) < panelText3.rect_scale.x) and (panel4.rect_global_position.distance_to(panelText4.rect_global_position) < panelText4.rect_scale.x):
		if okText == "Matched" and okText2 == "Matched" and okText3 == "Matched" and okText4 == "Matched":
			status.push_color(Color(0, 1, 0, 1)) # Green
			verified = true
			status.add_text("All Matched")
		
		elif okText == "" or okText2 == "" or okText3 == "" or okText4 == "":
			status.push_color(Color(.2, 0.2, .2, 1)) # Green
			status.add_text("Nothing happened")
		else:
			status.push_color(Color(0.5, 0, 0, 1)) # Dark red
			status.add_text ("Not Matched")
		
func _on_Panel_gui_input(event):
	if event is InputEventScreenDrag:
		panel.rect_position += event.relative
	
	for i in range (panelContainers.size()):
		if panel.rect_global_position.distance_to(panelContainers[i].rect_global_position) < panelContainers[i].rect_scale.x:
			panel.rect_global_position = panelContainers[i].rect_global_position
	
	if panel.rect_global_position.distance_to(panelText.rect_global_position) < panelText.rect_scale.x:
		okText = "Matched"
	pass # Replace with function body.

func _on_Panel2_gui_input(event):
	if event is InputEventScreenDrag:
		panel2.rect_position += event.relative
	
	for i in range (panelContainers.size()):
		if panel2.rect_global_position.distance_to(panelContainers[i].rect_global_position) < panelContainers[i].rect_scale.x:
			panel2.rect_global_position = panelContainers[i].rect_global_position
	
	if panel2.rect_global_position.distance_to(panelText2.rect_global_position) < panelText2.rect_scale.x:
		okText2 = "Matched"
		pass
	pass # Replace with function body.

func _on_Panel3_gui_input(event):
	if event is InputEventScreenDrag:
		panel3.rect_position += event.relative
		
	for i in range (panelContainers.size()):
		if panel3.rect_global_position.distance_to(panelContainers[i].rect_global_position) < panelContainers[i].rect_scale.x:
			panel3.rect_global_position = panelContainers[i].rect_global_position
	
	if panel3.rect_global_position.distance_to(panelText3.rect_global_position) < panelText3.rect_scale.x:
		okText3 = "Matched"

	pass # Replace with function body.

func _on_Panel4_gui_input(event):
	if event is InputEventScreenDrag:
		panel4.rect_position += event.relative
	
	for i in range (panelContainers.size()):
		if panel4.rect_global_position.distance_to(panelContainers[i].rect_global_position) < panelContainers[i].rect_scale.x:
			panel4.rect_global_position = panelContainers[i].rect_global_position
	
	if panel4.rect_global_position.distance_to(panelText4.rect_global_position) < panelText4.rect_scale.x:
		okText4 = "Matched"
	pass # Replace with function body.


func _on_TextureButton_pressed():
	if verified:
		Ui.expValue += 10
		Ui.restValue -= 15
		Ui.instrumentGuitarSes -= 1
	else:
		Ui.restValue -= 15
	get_tree().change_scene("res://insideInstrumentStudio2.tscn")
	pass # Replace with function body.
