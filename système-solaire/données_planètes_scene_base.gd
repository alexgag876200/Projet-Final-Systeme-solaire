extends Node3D
@export var vitesse_rotation: float

signal infos_vers_interface(infos: Dictionary)
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var parent_astre = get_parent()
	if parent_astre.has_signal("infos_astre"):
		parent_astre.connect("infos_astre", Callable(self, "_on_infos_astre"))


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	"""
	Rotation de l'astre
	"""
	rotation.y += deg_to_rad(vitesse_rotation)*delta
	
func _on_infos_astre(infos: Dictionary):
	emit_signal("infos_vers_interface", infos)
