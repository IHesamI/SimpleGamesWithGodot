extends CharacterBody2D

var speed=400
var Direction

var left=false
var right=false
var up=false
var down=false

func _ready() -> void:
	$PlayerAnimation.play('Idle')

func check_for_action(event:InputEvent,button_str:String):
	return event.is_action_pressed(button_str) 

func check_for_released(event:InputEvent,button_str:String):
	return event.is_action_released(button_str)


func move_down():
	Direction.y=1
func _input(event: InputEvent) -> void:
	Direction=Vector2.ZERO
	left=check_for_action(event,'move_left') or left 
	right=check_for_action(event,"move_right") or right
	up = check_for_action(event,'move_up') or up
	down = check_for_action(event,'move_down') or down

	var left_release=check_for_released(event,'move_left')
	var right_release=check_for_released(event,'move_right')
	var up_release=check_for_released(event,'move_up')
	var down_release=check_for_released(event,'move_down')

	if left_release or right_release:
		$PlayerAnimation.play('Idle')
		Direction.x=0
		left=not left_release if left==true else false
		right=not right_release if right==true else false

	if up_release or down_release :
		$PlayerAnimation.play('Idle')
		Direction.y=0
		down=not down_release	if down==true else false
		up =not up_release if up==true else false
	if left or right:
		$PlayerAnimation.play("move")
		Direction.x= -1 if left else  1 if right else 0	
		$PlayerAnimation.set_flip_h(false if Direction.x==1 else  true)
	if up or down:
		$PlayerAnimation.play('move')
		Direction.y= -1 if up else  1 if down else 0	

	velocity= Direction* speed
		
func _process(delta: float) -> void:
	move_and_slide()
