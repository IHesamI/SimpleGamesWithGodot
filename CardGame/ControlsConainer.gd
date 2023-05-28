extends PanelContainer

var NUM_ROWS=3
var NUM_COLUMNS=3
var bias=250
var SPACING=250

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	const CardGames=preload('res://CardControl.tscn')
	for row in NUM_ROWS:
		for column in NUM_COLUMNS:
			var CardGameNode=CardGames.instantiate()
			add_child(CardGameNode)
			var position=Vector2(column * SPACING + bias, row * SPACING + bias)
			CardGameNode.position=position
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
