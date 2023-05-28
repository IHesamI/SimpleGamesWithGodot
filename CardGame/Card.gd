extends Sprite2D
@export var front_texture:Image
@export var back_texture:Image
var is_front:bool 

func _ready() -> void:
	front_texture=setTheBackTexture(front_texture,'res://Assets/images/android-webview-beta_256x256.png')
	is_front=true

	await get_tree().create_timer(1).timeout

	back_texture=setTheBackTexture(back_texture,'res://Assets/android-webview-canary_256x256.png')
	is_front=false

func setTheBackTexture(imagenode,add):
	imagenode=Image.new()
	imagenode.load(add)
	changeTexture(imagenode)
	return imagenode

func changeTexture(imagenode):
	var this=get_node('.')
	this.texture=ImageTexture.new().create_from_image(imagenode)
		

func change_the_texture():
	if is_front:
		changeTexture(back_texture)
	else:
		changeTexture(front_texture)
	is_front =not is_front

func _on_flip_animation_animation_started(anim_name: StringName) -> void:
	var animationplayer=get_node('FlipAnimation')
	get_node('Timer').start()

