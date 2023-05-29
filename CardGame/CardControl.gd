extends Control
signal control_clicked(clicked_node,image_id)
var image_id:int
var timer:Timer
var mouseEnter:bool
func _ready() -> void:
	pass	
func _input(event) -> void:
	if (event is InputEventMouseButton) and (mouseEnter):
		print('zarp')
		control_clicked.emit(self,image_id)
		$SpriteCard/FlipAnimation.play("CardFlip")		

func _process(delta: float) -> void:
	pass

func set_texture_with_image(url_to_image,number):
	$SpriteCard.set_texutres(url_to_image)
	image_id=number
	print(number)
#number

func _on_mouse_entered() -> void:
	mouseEnter=true

func _on_mouse_exited() -> void:
	mouseEnter=false
