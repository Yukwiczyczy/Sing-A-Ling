extends Control

onready var howard = $TextureRect/spriteContainer/howard
onready var sophia = $TextureRect/spriteContainer/sophia
onready var naya = $TextureRect/spriteContainer/naya
onready var prince = $TextureRect/spriteContainer/prince


onready var person = $TextureRect/Label
onready var role = $TextureRect/Label2
onready var description = $TextureRect/description

var howardPress = 1
var sophiaPress = 1
var nayaPress = 1
var princePress = 1
var showGame = 1


func _physics_process(delta):
	#print("Howard: ", str(howardPress), " Sophia: ", str(sophiaPress), " Naya: ", str(nayaPress), " Prince: ", str(princePress), " Game: ", str(showGame))
	if showGame == 1:
		person.text = "Sing-A-Ling"
		role.text = "(Game)"
		description.text = "Sing-A-Ling is an interactive narrative game that combines elements of platformer and adventure genres. The player takes the role of Ling, a small–town girl with a gift for singing. The game follows Ling’s journey as she must pass the auditions for the global singing competition in order to save her mother’s life. Players must guide Ling to make her a true singer by training Ling learning the instruments and training her vocals."
	if howardPress == 0 and showGame == 1:
		person.text = "Ralph Howard"
		role.text = "(Game Developer and Project Leader)"
		description.text = "The game developer and project leader oversees the entire development process, manages the project timeline, implements the game mechanics, and handles the core programming tasks."
	if sophiaPress == 0 and showGame == 1:
		person.text = "Sophia Gutierrez"
		role.text = "(Game Animator)"
		description.text = "The game animator creates visual animations of the characters' sprites, environmental backgrounds, and game transitions and enhances the storytelling through expressive animations."
	if nayaPress == 0 and showGame == 1:
		person.text = "Shania Gwyneth"
		role.text = "(Game Artist)"
		description.text = "The game artist creates concept art and detailed designs for environments and interactive game elements while ensuring visual cohesion and aesthetic appeal that makes the gameplay fun, balanced, and engaging."
	if princePress == 0 and showGame == 1:
		person.text = "Prince Simons"
		role.text = "(Voice Actor)"
		description.text = "The voice actor, who also proposed the game concept, provides the voice work for the game and offers creative input throughout the development, helping to shape the game's direction and vision."
	pass
		
func _on_howard_pressed():
	if howardPress == 0:
		howard.rect_size.x = 128
		howard.rect_size.y = 128
		howard.rect_position.y = 0
		howardPress = 1
	elif howardPress == 1:
		howard.rect_size.x = 128
		howard.rect_size.y = 128
		howard.rect_position.y = -50

		howardPress = 0

	#sophia back to placement
	sophia.rect_size.x = 128
	sophia.rect_size.y = 128
	sophia.rect_position.y = 0
	showGame = 1
	sophiaPress = 1

	#naya back to placement
	naya.rect_size.x = 128
	naya.rect_size.y = 128
	naya.rect_position.y = 0
	showGame = 1
	nayaPress = 1
	
	#prince back to placement
	prince.rect_size.x = 128
	prince.rect_size.y = 128
	prince.rect_position.y = 0
	showGame = 1
	princePress = 1
	pass # Replace with function body.



func _on_sophia_pressed():
	if sophiaPress == 0:
		sophia.rect_size.x = 128
		sophia.rect_size.y = 128
		sophia.rect_position.y = 0
		sophiaPress = 1
		showGame = 1
	elif sophiaPress == 1:
		sophia.rect_size.x = 128
		sophia.rect_size.y = 128
		sophia.rect_position.y = -50
		sophiaPress = 0
	
	#howard back to placement
	howard.rect_size.x = 128
	howard.rect_size.y = 128
	howard.rect_position.y = 0
	howardPress = 1
	
	#naya back to placement
	naya.rect_size.x = 128
	naya.rect_size.y = 128
	naya.rect_position.y = 0
	nayaPress = 1
	
	#prince back to placement
	prince.rect_size.x = 128
	prince.rect_size.y = 128
	prince.rect_position.y = 0
	princePress = 1
	
	
	pass # Replace with function body.




func _on_prince_pressed():
	if princePress == 0:
		prince.rect_size.x = 128
		prince.rect_size.y = 128
		prince.rect_position.y = 0
		princePress = 1
	elif princePress == 1:
		prince.rect_size.x = 128
		prince.rect_size.y = 128
		prince.rect_position.y = -50
		princePress = 0
		
	#sophia back to placement
	sophia.rect_size.x = 128
	sophia.rect_size.y = 128
	sophia.rect_position.y = 0
	sophiaPress = 1
	
	#naya back to placement
	naya.rect_size.x = 128
	naya.rect_size.y = 128
	naya.rect_position.y = 0
	nayaPress = 1
	
	
	#howard back to placement
	howard.rect_size.x = 128
	howard.rect_size.y = 128
	howard.rect_position.y = 0
	howardPress = 1
	pass # Replace with function body.


func _on_naya_pressed():
	if nayaPress == 0:
		naya.rect_size.x = 128
		naya.rect_size.y = 128
		naya.rect_position.y = 0
		nayaPress = 1
	elif nayaPress == 1:
		naya.rect_size.x = 128
		naya.rect_size.y = 128
		naya.rect_position.y = -50
		nayaPress = 0

	#sophia back to placement
	sophia.rect_size.x = 128
	sophia.rect_size.y = 128
	sophia.rect_position.y = 0
	sophiaPress = 1

	#howard back to placement
	howard.rect_size.x = 128
	howard.rect_size.y = 128
	howard.rect_position.y = 0
	howardPress = 1
	
	#prince back to placement
	prince.rect_size.x = 128
	prince.rect_size.y = 128
	prince.rect_position.y = 0
	princePress = 1
	pass # Replace with function body.


func _on_exit_pressed():
	get_tree().change_scene("res://Menu.tscn")
	pass # Replace with function body.
