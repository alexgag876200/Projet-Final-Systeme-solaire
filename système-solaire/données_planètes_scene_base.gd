extends Node3D
@export var vitesse_rotation: float

signal infos_vers_interface(infos: Dictionary)
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	"""
	Connecte ce script enfant au signal 'infos_astre' de son parent
	et réémet ces informations vers l’interface.
	
	Retour :
		Aucun.
	"""
	var parent_astre = get_parent()
	if parent_astre.has_signal("infos_astre"):
		parent_astre.connect("infos_astre", Callable(self, "_on_infos_astre"))


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	"""
	Applique une rotation continue autour de l’axe Y à l’astre enfant.
	
	Paramètres :
	Temps écoulé depuis la dernière frame.
	
	Retour :
		Aucun.
	"""
	rotation.y += deg_to_rad(vitesse_rotation)*delta
	
func _on_infos_astre(infos: Dictionary):
	"""
	Reçoit les informations envoyées par l’astre parent via le signal 'infos_astre'
	et les réémet vers l’interface grâce au signal 'infos_vers_interface'.
	
	Paramètres :
		infos (Dictionary) Données physiques et orbitales de l’astre parent.
	
	Retour :
		Aucun.
	"""
	emit_signal("infos_vers_interface", infos)
