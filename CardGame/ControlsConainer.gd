extends CanvasLayer

var NUM_ROWS=3
var NUM_COLUMNS=4
#var bias=250
var pictures_and_control_ids:Dictionary
var SPACING=50

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	initial_childnodes()
	var index=0

func modifychilds(child,index):
		child.connect('control_clicked',_on_get_input)
		child.set_meta('id',index)
		return index+1
			
func _on_get_input(clicked_node:Control,image_id):
	print(clicked_node.get_meta('id')," ::: ",image_id)
	
	
func initial_childnodes():
	var folderpath='res://Assets/images'
	var directory=DirAccess.open(folderpath)
	var filelist=[]
	if (directory.dir_exists(folderpath)):
		directory.list_dir_begin()
		while true:
			var file=directory.get_next()
			if file=="":
				break
			var filepath=folderpath+'/'+file
			filelist.append(filepath)
		directory.list_dir_end()
#		directory.close()
	else:
		print("Failed to open directory:", folderpath)
		return
	var rng = RandomNumberGenerator.new()
	rng.randomize()

	var minNumber = 0
	var maxNumber = filelist.size()
	var uniqueNumbers = []

	while uniqueNumbers.size() < 6:
		var randomNumber = rng.randi_range(minNumber, maxNumber)
		if uniqueNumbers.find(randomNumber) == -1:
			uniqueNumbers.append(randomNumber)
	print(uniqueNumbers)
	set_pic_numbers_and_set_textures(uniqueNumbers,filelist)


func set_pic_numbers_and_set_textures(uniqueNumbers,filelist):
	var child_ids=[]
	var rng = RandomNumberGenerator.new()
	var childs= get_children()
	
	rng.randomize()
	for number in uniqueNumbers:
		pictures_and_control_ids[number]=[]
		while pictures_and_control_ids[number].size()<2:
			var randomNumber = rng.randi_range(0, 11)
			if pictures_and_control_ids[number].find(randomNumber) == -1 and child_ids.find(randomNumber)==-1:
				print(filelist[number])
				childs[randomNumber].set_texture_with_image(filelist[number].replace('.import',''),number)
				modifychilds(childs[randomNumber],randomNumber)
				pictures_and_control_ids[number].append(randomNumber)
				child_ids.append(randomNumber)
	print(pictures_and_control_ids)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
