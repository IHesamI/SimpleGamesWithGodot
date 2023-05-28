extends Control

var timer:Timer
var mouseEnter:bool
func _ready() -> void:
	pass	
func _input(event) -> void:
	
	if (event is InputEventMouseButton) and (mouseEnter):
		print('zarp')
		$SpriteCard/FlipAnimation.play("CardFlip")		

func _process(delta: float) -> void:
	pass


func _on_mouse_entered() -> void:
	mouseEnter=true

func _on_mouse_exited() -> void:
	mouseEnter=false
