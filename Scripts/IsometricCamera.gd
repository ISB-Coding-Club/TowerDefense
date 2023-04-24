extends Camera3D

@export var normal_speed: float = 2.0
@export var sprint_speed: float = 6.0

var forward = false
var backward = false
var left = false
var right = false
var sprint = false

func _ready():
	pass

func _process(delta):
	forward = Input.is_action_pressed("Cam_Forward")
	backward = Input.is_action_pressed("Cam_Backward")
	left = Input.is_action_pressed("Cam_Left")
	right = Input.is_action_pressed("Cam_Right")
	sprint = Input.is_action_pressed("Cam_Sprint")
	
	var speed = sprint_speed if sprint else normal_speed
	var movement_vector = Vector3()
	
	if forward:
		movement_vector.z -= speed * delta
	
	if backward:
		movement_vector.z += speed * delta
	
	if left:
		movement_vector.x -= speed * delta
	
	if right:
		movement_vector.x += speed * delta
	
	self.position += movement_vector
