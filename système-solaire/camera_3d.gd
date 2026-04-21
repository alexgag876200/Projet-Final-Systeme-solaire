extends Camera3D

@export var vitesse: float
@export var Vitesse_rotation: float


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var direction := Vector3.ZERO
	
	#Direction WASD
	if Input.is_key_pressed(KEY_W):
		direction -= transform.basis.z  # avancer
	if Input.is_key_pressed(KEY_S):
		direction += transform.basis.z  # reculer
	if Input.is_key_pressed(KEY_A):
		direction -= transform.basis.x  # gauche
	if Input.is_key_pressed(KEY_D):
		direction += transform.basis.x  # droite

	if direction != Vector3.ZERO:
		direction = direction.normalized()
	position += direction * vitesse * delta
	
	#Rotation QE
	if Input.is_key_pressed(KEY_Q):
		rotate_y(deg_to_rad(Vitesse_rotation*delta))
	if Input.is_key_pressed(KEY_E):
		rotate_y(deg_to_rad(-Vitesse_rotation*delta))
		
	if Input.is_key_pressed(KEY_Z):
		rotate_object_local(Vector3.LEFT, deg_to_rad(Vitesse_rotation*delta))
	if Input.is_key_pressed(KEY_X):
		rotate_object_local(Vector3.RIGHT, deg_to_rad(Vitesse_rotation * delta))
