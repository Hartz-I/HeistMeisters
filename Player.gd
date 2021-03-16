extends "res://Character/TemplateCharacter.gd"

var motion = Vector2() #uses in move and slide

func _physics_process(delta):
	manage_movement()
	move_and_slide(motion)
	
func manage_movement():
	#faces the mouse
	look_at(get_global_mouse_position())
	
	
	#move updown
	if Input.is_action_pressed("move_up") and not Input.is_action_pressed("move_down"):
		#motion.y = -SPEED #goes in a constant speed
		#motion.y -= SPEED #speed increases
		#we'll use clamp for smoother movement
		motion.y = clamp(motion.y - SPEED , -MAX_SPEED, 0)
	elif Input.is_action_pressed("move_down") and not Input.is_action_pressed("move_up"):
		motion.y = clamp(motion.y + SPEED , 0 , MAX_SPEED)
	else:
		motion.y= lerp(motion.y, 0, FRICTION) #linear interpulate. value goes from this to that
		#for this case it goes from whatever it has now to zero at the rate of friciton
		
	#move left rigt
	if Input.is_action_pressed("move_left") and not Input.is_action_pressed("move_right"):
		#motion.y = -SPEED #goes in a constant speed
		motion.x = clamp(motion.x - SPEED , -MAX_SPEED , 0) #speed increases
	elif Input.is_action_pressed("move_right") and not Input.is_action_pressed("move_left"):
		motion.x = clamp(motion.x + SPEED , 0 , MAX_SPEED)
	else:
		motion.x=lerp(motion.x, 0, FRICTION)
