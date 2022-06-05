extends KinematicBody2D

enum State { STOP, MOVE }
var state = State.MOVE

const TARGET_FPS = 60

export var ACCELERATION = 20
export var MAX_SPEED = 150
export var FRICTION = 10
export var AIR_RESISTANCE = 1
export var GRAVITY = 10
export var JUMP_FORCE = 300

var spring = -600
var motion = Vector2.ZERO

onready var sprite = $Skin/Sprite
onready var animationPlayer = $Skin/AnimationPlayer



func _physics_process(delta):
	var x_input = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	
	if state != State.MOVE:
		return
		
	if x_input != 0:
		animationPlayer.play("Run")
		motion.x += x_input * ACCELERATION * delta * TARGET_FPS
		motion.x = clamp(motion.x, -MAX_SPEED, MAX_SPEED)
		sprite.flip_h = x_input < 0
		
	else:
		animationPlayer.play("Idle")
	
	motion.y += GRAVITY * delta * TARGET_FPS
	
	if is_on_floor():
		if x_input == 0:
			motion.x = lerp(motion.x, 0, FRICTION * delta)
#			$AudioStreamPlayer2D.play()
		if Input.is_action_just_pressed("ui_up"):
			motion.y = -JUMP_FORCE
#			$AudioStreamPlayer2D.stop()
	else:
		animationPlayer.play("Jump")
#		$AudioStreamPlayer2D2.play()
		if Input.is_action_just_released("ui_up") and motion.y < -JUMP_FORCE/2:
			motion.y = -JUMP_FORCE/2
	if x_input == 0:
			motion.x = lerp(motion.x, 0, AIR_RESISTANCE * delta)
	if motion.y > 0 and not is_on_floor():
		animationPlayer.play("Fall")
	elif motion.y < 0 and not is_on_floor():
		animationPlayer.play("Jump")
	motion = move_and_slide(motion, Vector2.UP)
