extends RigidBody2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var speed = 200
var rotation_speed = 80
var max_speed = 25

slave var slave_position = Vector2()
slave var slave_rotation = 0


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if is_network_master():
		if Input.is_action_pressed("ui_up"):
			add_force(Vector2(0,0), Vector2(cos(rotation), sin(rotation))*delta*speed)
	
		if Input.is_action_pressed("ui_down"):
			add_force(Vector2(0,0), Vector2(cos(rotation), sin(rotation))*delta*(-speed))	
	
		if get_linear_velocity().length() > max_speed:
			set_linear_velocity(get_linear_velocity().normalized()*max_speed)
	
		if get_linear_velocity().length() < 0:
			set_linear_velocity(get_linear_velocity().normalized()*0)
	
		if Input.is_action_pressed("ui_left"):
			set_angular_velocity(-rotation_speed*delta)
	
		if Input.is_action_pressed("ui_right"):
			set_angular_velocity(rotation_speed*delta)
		
		#As long as TAB is pressed (hold down)
		if Input.is_action_pressed("ui_focus_next"):
			set_angular_velocity(0)
			set_linear_velocity(get_linear_velocity()*0)
	else:
		position = slave_position
		rotation = slave_rotation
	
