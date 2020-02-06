extends KinematicBody2D
# this is the movement controls
const Speed = 200
#const wall Vector2(1,1)

var destination = Vector2()
var gap = Vector2()


func _ready():
	
	destination = Vector2(position)
	
	
func _process(delta):
	
	#this moves the body to the destination 
	if destination != position:
		gap = Vector2(destination - position)
		move_and_slide(gap.normalized() * Speed)
		
		#this will snap to the destiation if sprite is close to mouse click
		if gap.abs() < Vector2(2,2):
			set_position(destination)
	
	#this moves stops the movement if destination is == postion
	if destination == position:
		move_and_slide(gap*0)
		
	if is_on_wall():
		destination = position
	
	
	
	pass
func _input(event):
	if Input.is_action_just_pressed("ui_mouse"):
		destination = get_global_mouse_position()
		
		#is_colliding()
		#test add
	


