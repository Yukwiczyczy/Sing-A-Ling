extends KinematicBody2D

#setting the direction in 2D form
var direction = Vector2.ZERO

#declare for animation
onready var animate = $AnimationPlayer
onready var walking = $AudioStreamPlayer2D

#make the speed
var speed:float = 200

#process the player movement & animation
func _physics_process(delta):
	#declare the movement same with direction
	var movement = Vector2.ZERO
	
	#compute the movement of the player based on the 2D plane
	movement.x = int(Input.is_action_pressed("ui_right")) - int(Input.is_action_pressed("ui_left"))
	movement.y = int(Input.is_action_pressed("ui_down")) - int(Input.is_action_pressed("ui_up"))
	
	#normalize the movement value (this will create a constant movement for all direction)
	movement = movement.normalized()
	
	#initiate the last movement for the animation
	var last_movement = Vector2.ZERO
	
	#make the animation from the movement
	var num = 1

	#make the movement process of the player
	if movement != Vector2.ZERO:
		#move from the direction
		direction = movement
		num += 1 * delta
		#animate the animation in moving process
		if movement.x > 0:
			animate.play("runRight")
			pass
		elif movement.x < 0:
			animate.play("runLeft")
			#walking.play(num)
			pass
		elif movement.y < 0:
			animate.play("runUp")
			#walking.play(num)
	
			pass
		elif movement.y > 0:
			animate.play("runDown")
			pass
			
	else:
		#no movement at all
		direction = Vector2.ZERO
		walking.stop()
		
		#slow the movement into friction
		direction = direction.move_toward(Vector2.ZERO, speed * delta)
	
	#make the movement
	move_and_collide(direction * speed * delta)
		
