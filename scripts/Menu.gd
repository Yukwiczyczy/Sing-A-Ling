extends Control

var saveFilePath = "res://saved/"

func _on_newGame_pressed():
	get_tree().change_scene("res://transitionScene.tscn")

func _on_continue_pressed():
	Ui.load_game()
	get_tree().change_scene("res://outside.tscn")
	



func _on_TextureButton_pressed():
	get_tree().change_scene("res://About.tscn")
	pass # Replace with function body.
