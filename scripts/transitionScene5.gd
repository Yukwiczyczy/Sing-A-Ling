extends Node2D

var timer
var time = false
var timeText = 5
var countdownText = ""  # Text to display the countdown
var addEnergy = false
var energyAdded = false
onready var label = $Label
onready var music = $Sprite

func _ready():
	timer = Timer.new()
	add_child(timer)
	timer.wait_time = 5
	timer.connect("timeout", self, "_on_Timer_timeout")

func _physics_process(delta):
	if timeText > 0:
		timeText -= 1 * delta
		
	music.rotation_degrees += 80 * delta
	music.scale.x += delta
	music.scale.y += delta
	
	print (int(timeText) == 0, timeText)
	if int(timeText) == 0:
		_on_Timer_timeout()
		get_tree().change_scene("res://storyBoarPassed.tscn")
		
	if addEnergy:
		timer.start()
		addEnergy = false
		energyAdded = false
		
func _on_Timer_timeout():
	get_tree().change_scene("res://storyBoarPassed.tscn")
		
