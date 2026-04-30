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

func _input(event: InputEvent) -> void:
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
		print("=== CLIC DÉTECTÉ ===")
		
		var espace = get_world_3d().direct_space_state
		var origine = project_ray_origin(event.position)
		var fin = origine + project_ray_normal(event.position) * 1e12
		var query = PhysicsRayQueryParameters3D.create(origine, fin)
		var result = espace.intersect_ray(query)
		
		print("Résultat raycast : ", result)
		
		if result:
			var objet = result["collider"].get_parent()
			print("Objet touché : ", objet.name)
			if objet.has_method("emettre_donnees"):
				print("Méthode trouvée, émission...")
				objet.emettre_donnees()
			else:
				print("PROBLÈME : emettre_donnees() introuvable sur ", objet.name)
		else:
			print("PROBLÈME : raycast n'a rien touché")
