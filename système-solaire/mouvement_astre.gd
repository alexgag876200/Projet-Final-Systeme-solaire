extends Node3D



@export var centre_rotation: Node3D
@export var lune: Node3D
@export var autres_corps: Array[Node3D]

@export_group("élements orbitaux")
@export var demi_grand_axe: float
@export var excentricite: float
@export var inclinaison: float
@export var argument_perihelie: float
@export var perihelie: float = 664862e3
@export var vitesse_perihelie: float
@export var periode_orbitale: float = 299819.0
@export var temps_rot_soleil: float


@export_group("Propriétés physiques")
@export var masse: float = 1.989e27
@export var rayon: float
@export var temps_rotation_sur_elle_meme:float

@export_group("Paramètre de conversion simulation")
@export var min_distance_simulee: float = 15.0
@export var max_distance_simulee: float = 40.0
@export var min_distance_reelle: float = 5e8
@export var max_distance_reelle: float = 9e8

@export_group("Paramètre de simulation")
@export var periode_relative: float = 20.0
@export var etapes_calcul_par_ecran: int = 10000

const masse_soleil :float =1.9884e30
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
func donnée_planètes ():
	for corps in donnees.donnee:
		


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



func acceleration(position_reelle: Vector3) -> Vector3:
	var a = Vector3.ZERO
	for corps in autres_corps:
		var r_ij = corps.r_i - position_reelle   # vecteur vers l'autre corps, en mètres
		var dist = r_ij.length()
		if dist < 1e3:
			continue
		a += G * corps.masse / dist**3 * r_ij
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
	r_i = Vector3(perihelie, 0, 0)
	v_i = Vector3(0, 0, vitesse_perihelie * 1000.0)
	periode = periode_orbitale
	
# Called every frame. 'delta' is the elapsed time since the previous frame.



func _process(delta: float) -> void:
	runge_kotta(delta * temps_sec_mois)
	position = conv_position_reelle_a_simulee(r_i)
