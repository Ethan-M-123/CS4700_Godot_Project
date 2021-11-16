extends KinematicBody2D

var direction = Vector2(0,0)
export var SPEED = 100
export var velocity = Vector2(0,0)
onready var screen_size = get_viewport_rect().size

func _ready():
	$AnimatedSprite.play("moving")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_pressed("ui_up"):
		direction = Vector2(0,-1)
		rotation = deg2rad(-90)
	elif Input.is_action_pressed("ui_down"):
		direction = Vector2(0,1)
		rotation = deg2rad(90)
	elif Input.is_action_pressed("ui_left"):
		direction = Vector2(-1,0)
		rotation = deg2rad(180)
	elif Input.is_action_pressed("ui_right"):
		direction = Vector2(1,0)
		rotation = deg2rad(0)
		
	
	
	position.x = wrapf(position.x, 0, screen_size.x)
	position.y = wrapf(position.y, 0, screen_size.y)
	
	velocity = SPEED * direction * delta
	
	move_and_slide(100*velocity)
