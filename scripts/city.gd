extends Node2D

var enterCol = 0

func _physics_process(delta):
	print ("Enter collision: ", enterCol)
	if enterCol ==  -99:
		Ui.bottomText = "Press enter to go home"
		Ui.bottomText2 = "Metro Manila"
		if Input.is_action_just_pressed("enter"):
			get_tree().change_scene("res://goHomeAnimation.tscn")
	elif enterCol == 1:
		Ui.bottomText2 = "Audition"
		if Ui.restValue < 100 and Ui.expValue == 100:
			Ui.bottomText = "Insufficient energy, rest more."
		elif Ui.restValue == 100 and Ui.expValue < 100:
			Ui.bottomText = "Insufficient experience, train more."
		elif Ui.restValue < 100 and Ui.expValue < 100: 
			Ui.bottomText = "Both energy and experience are insufficient"
		else:
			Ui.bottomText = "Energy and Experience are met, you can now proceed to audition."
			if Input.is_action_just_pressed("enter"):
				get_tree().change_scene("res://transitionScene4.tscn")
		pass 
	elif enterCol == 60:
		Ui.bottomText2 = "Sol"
		Ui.bottomText = "Hi I'm sol, did you see SunJae?"
	elif enterCol == 61:
		Ui.bottomText2 = "Howard"
		Ui.bottomText = "Hi I'm Howard, what a nice place to rest. Don't you agree?"
	elif enterCol == 62:
		Ui.bottomText2 = "Sophia"
		Ui.bottomText = "I know your vocal coach is Prince and he is a terrible coach. Anyway, goodluck to your audition!"
	else: 
		Ui.bottomText= ""
		Ui.bottomText2 = ""
	
	pass


func _on_goHome_body_entered(body: PhysicsBody2D):
	enterCol -= 99


func _on_goHome_body_exited(body: PhysicsBody2D):
	enterCol = 0

func _on_enterAudition_body_entered(body: PhysicsBody2D):
	enterCol = 1


func _on_enterAudition_body_exited(body: PhysicsBody2D):
	enterCol = 0





func _on_sol_body_entered(body):
	enterCol = 60
	
	pass # Replace with function body.


func _on_ralph_body_entered(body):
	enterCol = 61
	
	pass # Replace with function body.


func _on_sophia_body_entered(body):
	enterCol = 62
	
	pass # Replace with function body.


func _on_sophia_body_exited(body):
	enterCol = 0
	pass # Replace with function body.


func _on_ralph_body_exited(body):
	enterCol = 0
	pass # Replace with function body.


func _on_sol_body_exited(body):
	enterCol = 0
	pass # Replace with function body.
