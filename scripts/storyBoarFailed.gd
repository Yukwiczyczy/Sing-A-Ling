extends Node2D



func _on_TextureButton_pressed():
	Ui.restValue =25
	Ui.expValue = 50
	Ui.instrumentGuitarSes = 1
	Ui.instrumentPianoSes = 1
	Ui.vocalSession = 2
	Ui.passedGuitar = 0
	Ui.passedPiano = 0
	Ui.passedTitle = 0
	Ui.music = 0
	Ui.guitar = 0
	Ui.piano = 0
	Ui.vocal = 0
	
	get_tree().change_scene("res://outsideAudition.tscn")



