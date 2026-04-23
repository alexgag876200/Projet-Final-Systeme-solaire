extends Node3D





@export var autres_corps: Array[Node3D]



var demi_grand_axe: float 
var excentricite: float
var inclinaison: float
var argument_perihelie: float
var perihelie: float 
var vitesse_perihelie: float
var periode_orbitale: float 
var temps_rot_soleil: float

var masse: float  
var rayon: float
var temps_rotation_sur_elle_meme: float


@export_group("Paramètre de conversion simulation")
@export var min_distance_simulee: float
@export var max_distance_simulee: float
@export var min_distance_reelle: float
@export var max_distance_reelle: float

@export_group("Paramètre de simulation")
@export var periode_relative: float = 20.0
@export var etapes_calcul_par_ecran: int = 50


const G: float = 6.673e-11

var distance_entre_astre: Vector3
var r_i: Vector3
var v_i: Vector3
var a_i: Vector3


var temps_sec_mois: float= 2592000
var temps_ecoule: float = 0.0
var k1: Vector3
var k2: Vector3
var k3: Vector3
var k4: Vector3

var periode : float
# Called when the node enters the scene tree for the first time.



func conv_position_reelle_a_simulee(position_reelle : Vector3) -> Vector3:
	"""Effectue la conversion d'une position réelle à une position de l'espace 
	de la simulation
	
	Paramètres:
	position_reelle -- la position réelle à convertir
	
	Retour :
	la position dans le monde de la simulation à utiliser
	"""
	
	
	if not position_reelle.is_finite():
		return Vector3.ZERO

	var distance_reelle = position_reelle.length()
	if distance_reelle <= 0.0:
		return Vector3.ZERO

	var t = inverse_lerp(min_distance_reelle, max_distance_reelle, distance_reelle)
	if not is_finite(t):
		t = 0.0

	var distance_simulee = lerp(
		min_distance_simulee,
		max_distance_simulee,
		clamp(t, 0.0, 1.0)
	)

	return position_reelle.normalized() * distance_simulee


func donnees_planetes(data: Dictionary) :
	demi_grand_axe = data["demi_grand_axe"]
	excentricite = data["excentricite"]
	inclinaison = data["inclinaison"]
	argument_perihelie  = data["argument_perihelie"]
	perihelie  = data["perihelie"]
	vitesse_perihelie  = data["vitesse_perihelie"]
	periode_orbitale  = data["periode_orbitale"]
	temps_rot_soleil  = data["temps_rot_soleil"]
	masse  = data["masse"]
	rayon  = data["rayon"]
	temps_rotation_sur_elle_meme  = data["temps_rotation_sur_elle_meme"]
	
	
	
	

func assignation_donnees_planete() -> void:
	
	for corps in donnees.DONNEES_CORPS:
		if corps["nom"] == self.name:
			
			donnees_planetes(corps)
			return

	
	
	
	

func acceleration(position_reelle: Vector3) -> Vector3:
	var a := Vector3.ZERO

	for corps in autres_corps:
		if corps == self:
			continue

		
		if not ("r_i" in corps and "masse" in corps):
			continue


		if corps.r_i == null:
			continue

		var r_ij = corps.r_i - position_reelle
		var dist = r_ij.length()

		if not is_finite(dist) or dist < 1e3:
			continue

		a += G * corps.masse * r_ij / (dist * dist * dist)

	return a






func runge_kotta(temps_dernier_ecran):
		#Nombre de période à simuler dans l'écran
	var dt = temps_dernier_ecran / float(etapes_calcul_par_ecran)
		
	for i in range(etapes_calcul_par_ecran):
		# k1
		var k1_r = v_i
		var k1_v = acceleration(r_i)

		# k2
		var k2_r = v_i + 0.5 * dt * k1_v
		var k2_v = acceleration(r_i + 0.5 * dt * k1_r)

		# k3
		var k3_r = v_i + 0.5 * dt * k2_v
		var k3_v = acceleration(r_i + 0.5 * dt * k2_r)

		# k4
		var k4_r = v_i + dt * k3_v
		var k4_v = acceleration(r_i + dt * k3_r)

		# Mise à jour finale
		r_i += (dt / 6.0) * (k1_r + 2.0*k2_r + 2.0*k3_r + k4_r)
		v_i += (dt / 6.0) * (k1_v + 2.0*k2_v + 2.0*k3_v + k4_v)
		
		
		
		
		
		
func _ready() -> void:

	assignation_donnees_planete()
	periode = periode_orbitale
	r_i = Vector3(perihelie, 0, 0)
	v_i = Vector3(0, 0, vitesse_perihelie * 1000.0)


# Called every frame. 'delta' is the elapsed time since the previous frame.




func _process(delta: float) -> void:
	runge_kotta(delta * temps_sec_mois)
	position = conv_position_reelle_a_simulee(r_i)
