extends Node2D

var label_:Label
var numbers:Array
var operator
var operand1
var operand2
func _ready() -> void:
	var buttons =get_tree().get_nodes_in_group('buttons')
	label_=get_node('Label')
#	TODO 
#	commented FOR DEV 
#	await get_tree().create_timer(2).timeout
	clear_screen()
	for button in buttons:
		button.pressed.connect(handlePressed.bind(button.text))

func clear_screen():
	label_.text=''

func _process(delta: float) -> void:
	pass

func handlePressed(text:String):
	var number=text.to_int()
	
	if text=='=' and label_.text!='' and operand1!=null:
		operand2=label_.text.to_int()
		label_.text=str(calculate_result(operand1,operand2,operator))
		reset_variables()
		print(label_.text)		
		return	
	if text=='ce':
		reset_variables()
		label_.text=''
	if number!=0 or text=='0':
		label_.text=label_.text+text
		label_.text=str(label_.text.to_int())
	else :
		if operand1==null:
			operand1=label_.text.to_int()
		operator=text
		label_.text=''
		
func calculate_result(num1,num2,operator):
	if operator=='X':
		return num1*num2
	elif  operator=='/':
		return num1*num2
	elif operator=='-':
		return num1-num2
	else:
		return num1+num2
		
func reset_variables():
	operand1=null
	operand2=null
	operator=null
