extends Node

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
const PORT = 4711

# Called when the node enters the scene tree for the first time.
#func _ready():
#	pass # Replace with function body.

func on_host_game():
	print("host game selected")


func on_join_game(ip):#
	print("join game selected: ",ip)




# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
