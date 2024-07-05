extends Node2D

onready var animate = $expBar
onready var expText = $expBar/expText
onready var restText = $restBar/restText
onready var rest = $restBar

onready var text = $RichTextLabel
onready var text2 = $RichTextLabel2
onready var text3 = $RichTextLabel3

onready var text2Con = $TileMap2
onready var dialogCon = $DialogBox


onready var badgePiano = $piano
onready var badgeGuitar = $guitar
onready var badgeVocal = $vocal
onready var badgeMusic = $music

func _ready():
	animate.play("default")
	pass

func _physics_process(delta):
	
	print (Ui.instrumentPianoSes)
	if Ui.vocal == 0:
		badgeVocal.hide()
	else: 
		badgeVocal.show()
		
	if Ui.piano == 0:
		badgePiano.hide()
	else: 
		badgePiano.show()

	if Ui.guitar == 0:
		badgeGuitar.hide()
	else: 
		badgeGuitar.show()
		
	if Ui.music == 0:
		badgeMusic.hide()
	else: 
		badgeMusic.show()
	
	expText.text = str(Ui.expValue)
	restText.text = str(Ui.restValue)
	#print("Experiece: ", expValue, "Rest: ", restValue)
	#print(Ui.bottomText)
	#print(text.text)
	
	
	if Ui.bottomText2.empty():
		text2.hide()
		text2Con.hide()
	else:
		text2.show()
		text2Con.show()
		text2.text = Ui.bottomText2
		
	if Ui.bottomText.empty():
		text.hide()
		dialogCon.hide()
	else:
		text.show()
		dialogCon.show()
		text.text = Ui.bottomText
		
	if Ui.bottomText3.empty():
		text3.hide()
	else:
		text3.show()
		text3.text = Ui.bottomText3
		
	
	if Ui.expValue >= 25 and Ui.expValue < 50:
		animate.play("25")
	elif Ui.expValue >= 50 and Ui.expValue < 75:
		animate.play("50")
	elif Ui.expValue >= 75 and Ui.expValue < 100:
		animate.play("75")
	elif Ui.expValue >= 100:
		animate.play("100")
	

	if Ui.restValue >= 25 and Ui.restValue < 50:
		rest.play("25")
	elif Ui.restValue >= 50 and Ui.restValue < 75:
		rest.play("50")
	elif Ui.restValue >= 75 and Ui.restValue < 100:
		rest.play("75")
	elif Ui.restValue >= 100:
		rest.play("100")
	pass
	
func _on_Button_pressed():
	Ui.save_game()
	pass # Replace with function body.


func _on_TextureButton_pressed():
	get_tree().change_scene("res://Menu.tscn")
	pass # Replace with function body.
