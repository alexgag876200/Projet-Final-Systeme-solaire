extends RigidBody3D

@export var centre_rotation: RigidBody3D
@export var lune: RigidBody3D

const masse_corps_rotation :float =1.9884e30
const G: float = 6.673e-11

var masse: float = 1.989e27
var periapside: float = 664862e3

var periode_orbitale: float = 299819.0







@export_group("Paramètre de conversion simulation")
@export var min_distance_simulee: float = 15.0
@export var max_distance_simulee: float = 40.0
@export var min_distance_reelle: float = 5e8
@export var max_distance_reelle: float = 9e8

@export_group("Paramètre de simulation")
@export var periode_relative: float = 20.0
@export var etapes_calcul_par_ecran: int = 10000

var r_i: Vector3
var v_i: Vector3
var a_i: Vector3

var f_g1: Vector3
var f_g2: Vector3
var temps_ecoule: float = 0.0
var k1: Vector3
var k2: Vector3
var k3: Vector3
var k4: Vector3
var h: float
var periode : float
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
func conv_position_reelle_a_simulee(position_reelle : Vector3) -> Vector3:
	"""Effectue la conversion d'une position réelle à une position de l'espace 
	de la simulation
	
	Paramètres:
	position_reelle -- la position réelle à convertir
	
	Retour :
	la position dans le monde de la simulation à utiliser
	"""
	
	var distance_relle = position_reelle.length()
	var ratio_distance = inverse_lerp(min_distance_reelle, max_distance_reelle, 
		distance_relle)
	var facteur_distance_simulee = lerp (min_distance_simulee, max_distance_simulee,
		 ratio_distance)
	
	return position_reelle.normalized() * facteur_distance_simulee

func calculer_acceleration_gravitationnelle(position_rellee: Vector3) -> Vector3:
	"""Calcule l'accélération gravitationnelle exercée sur le corps selon sa position
	
	Paramètre:
	position_reelle : sa position dans l'espace en m
	
	Retour:
	L'accélération gravitationnelle exercée sur le corps en m/s^2
	"""
	var facteur = -G * masse * masse_corps_rotation / (position_rellee.length()**3)
	var force = (position_rellee - centre_rotation.position) * facteur
	return force / masse
func runge_kotta(temps_dernier_ecran):
		#Nombre de période à simuler dans l'écran
	var nb_periode = temps_dernier_ecran  * periode / periode_relative
	#Pas de la simulation
	var h = nb_periode / etapes_calcul_par_ecran
		
	for i in range(etapes_calcul_par_ecran):
		var a_i = calculer_acceleration_gravitationnelle(r_i)
		var v_i_plus_1 = v_i + h * a_i
		
		v_i = v_i_plus_1
		k1 = r_i + h * v_i
		k2= r_i+ h/2*k1
		k3= r_i+ h/2*k2
		k4= r_i+h*k3
		r_i= r_i+(1/6*h*(k1+2*k2+2*k3+k4))
