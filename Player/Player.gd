extends KinematicBody2D

var motion = Vector2(0,0)
const SPEED = 1000
const GRAVITY = 150
const UP = Vector2(0,-1)
const JUMP_SPEED = 3000

signal animate

func _physics_process(delta):
	apply_gravity()
	jump()
	move()
	animate()
	move_and_slide(motion, UP) # engine automatically calculate motion*delta
	
	
func apply_gravity():
	if not is_on_floor():
		motion.y += GRAVITY
	else:
		motion.y = 0

func jump():
	if Input.is_action_pressed("jump") and is_on_floor():
		motion.y -= JUMP_SPEED

func move():
	if Input.is_action_pressed("left") and not Input.is_action_pressed("right"):
		motion.x = -SPEED
	elif Input.is_action_pressed("right") and not Input.is_action_pressed("left"):
		motion.x = SPEED
	else:
		motion.x = 0


func animate():
	# Every frame will emite a signal called animate with a parametre called motion
	emit_signal("animate", motion)








