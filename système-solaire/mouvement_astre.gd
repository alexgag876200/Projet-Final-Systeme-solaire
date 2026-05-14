extends Node3D


# array pour stocker les astres dans une base de données pour des calculs comme l'accélération, ect ...
var autres_corps: Array[Node3D]

var interface_node: Node

# données qui sont cherchées dans la base de données
var demi_grand_axe: float 
var excentricite: float
var inclinaison: float
var argument_perihelie: float
var perihelie: float 
var vitesse_perihelie: float
var periode_orbitale: float 
var temps_rot_soleil: float
var parent_nom: String
var parent_node: Node3D
var masse: float  
var rayon: float
var temps_rotation_sur_elle_meme: float
var m_parent

"""
paramètres qui sont indépandant pour chaque astre, donc placer dans l'inspecteur 
pour permettre la modification indépendante tout en gardant un script commun.
"""
@export_group("Paramètre de conversion simulation")
@export var min_distance_simulee: float
@export var max_distance_simulee: float
@export_group("Paramètre de simulation")
@export var etapes_calcul_par_ecran: int = 10

# constante 
const G: float = 6.673e-11
var temps_sec_mois: float= 2592000

# variables utilisées pour les différents calculs
var min_distance_reelle: float
var max_distance_reelle: float
"
 Pour les vecteurs, s'assurer de fixer la valeur initial à 0 pour éviter qu'il y aurait des données invisibles qui se rajoutent à ceux-ci
"
var distance_entre_astre:= Vector3.ZERO
var r_i:= Vector3.ZERO
var v_i:= Vector3.ZERO
var a_i:= Vector3.ZERO
var k1:= Vector3.ZERO
var k3:= Vector3.ZERO
var k4:= Vector3.ZERO

# Variables utilisé pour la vitesse de la simulation et les intéractions avec l'interface
var temps_ecoule: float = 0.0
var vitesse_simu: float = 1.0
var periode : float


func conv_position_reelle_a_simulee(position_reelle : Vector3) -> Vector3:
	"""Effectue la conversion d'une position réelle à une position de l'espace 
	de la simulation
	
	Paramètres:
		position_reelle: la position réelle de l'astre à convertir pour la simulation
	
	Retour :
    	position convertie dans l’espace de la simulation

	fonction is _finite est utilisé pour éviter les problématique liées au 
	au division par 0, au valeurs trop petite et lorsqu'il y a tout simplement pas
	de valeur pour une certaine donnée. Utilisé comme sécurité
	"""
	if not position_reelle.is_finite():
		return Vector3.ZERO

	var distance_reelle = position_reelle.length()
	if distance_reelle <= 0.0:
		return Vector3.ZERO

	var t = inverse_lerp(min_distance_reelle, max_distance_reelle, distance_reelle)
	if not is_finite(t):
		t = 0.0

	var distance_simulee = lerp(min_distance_simulee,max_distance_simulee,clamp(t, 0.0, 1.0))

	return position_reelle.normalized() * distance_simulee


func donnees_planetes(data: Dictionary) :
	"""
	prend les données dans le script données_système et fournit celles de l'astre en
	fonction de celui-ci. Si nécessaire, pour certaines lunes calculer la vitesse au
	périhélie et la position de celui-ci si elle n'est pas fournie dans la base de données
	Paramètres: 
		data : dictionnaire contenant les données des astres
	"""
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
	parent_nom = data["parent"]
	m_parent = data["masse_parent"]
	
	# Si pas de parent (ex : Soleil), on arrête là
	if m_parent == null:
		return

	# Calcul automatique si valeurs manquantes
	if perihelie == 0.0:
		perihelie = demi_grand_axe * (1.0 - excentricite)

	if vitesse_perihelie == 0.0:
		vitesse_perihelie = sqrt(G * m_parent * (1.0 + excentricite) / perihelie)

func assignation_donnees_planete() -> void:
	"""
	La fonction va être utilisée avec la fonction données_planètes pour venir isoler 
	et donner les bonnes valeurs à chaques astres en allant rechercher les données associées
	au nom de l'astre dans la base de données
	
	
	"""
	for corps in donnees.DONNEES_CORPS:
		if corps["nom"] == self.name:
			
			donnees_planetes(corps)
			return


func acceleration(position_reelle: Vector3) -> Vector3:
	"""
	Effectue le calcul de l'intéraction gravitationnelle entre les astres en utilisant
	la deuxième loi de Isaac Newton
	Passer tous les astres de l'array les uns après les autres et effectuer la somme des
	vecteurs d'accélération
	Ignore l'astre lui-même car il n'intéragie pas avec lui même pour le calcul d'accélération
	Retourne :
		l'intéraction gravitationelle spécifique à l'astre en question
	Paramètres:
		a: accélération totale du système
		r_ij: distance vectorielle
		dist: distance linéaire
		Position_reelle: position de l'astre 
	"""
	var a :Vector3 = Vector3.ZERO
	
	for corps in autres_corps:
		#évite de calculer l'accélération avec le corps lui même
		if corps == self:
			continue
		
		var r_ij = corps.r_i - position_reelle
		var dist = r_ij.length()
		if dist < 1.0:   # sécurité anti division par zéro
			continue
		
		a += G * corps.masse * r_ij / (dist **3)

	return a

func initialiser_position_et_vitesse() -> void:
	"""
	À partir des données selectionnées pour une date en particulier, isoler la position
	et la vitesse de chaque astre

	Paramètres:
		r_i: vecteur de la position initiale
		v_i: vitesse à la position initiale
		
	La position initiale est simplement le moment où est-ce qu'on commence la simulation
	Date choisi: 11 septembre 2001
	"""
	for data in donnees.position_astre:
		if data["nom"] == self.name:
			r_i = data["position"]
			v_i = data["vitesse"]
			return
func changement_vitesse_lunes() -> void:
	"""
	La fonction accélère le déplacement des lunes en se fiant sur si elle font partie de la liste les contenant 
	dans la base de données (fonction identification_lunes )
	
	Retourne:
		temps_sec_mois: temps en secondes équivalent à un mois accéléré par 50 en comparaison avec les planètes 
	"""
	if identification_lunes() == true:
		temps_sec_mois = temps_sec_mois * 50.0
		return

func identification_lunes():
	"""
	Fonction identifiant si le nom de l'astre fait partie de la base de donnée contenant le nom des différentes 
	lunes choisi pour la simulation
	
	Retourne :
		True : si l'astre est une lune
		False: si l'astre n'est pas une lune
	"""
	for data in donnees.noms_lunes:
		if data["nom"] == self.name:
			return true
	return false


func _on_interface_slider_changed(value: float) -> void:
	"""
	Callback appelé lorsque l’interface modifie la vitesse de simulation.

	Paramètres :
		Nouvelle valeur du slider envoyée par l’interface.
	
	Retour :
		Aucun.
	"""
	vitesse_simu = value

func runge_kotta(temps_dernier_ecran):
	"""
	Fonction utilisant la méthode de Runge-kotta de quatrième degré pour calculer 
	la position suivante de l'astre et la vitesse de celui-ci à la 
	nouvelle position établi
	Cette méthode effectue quatre estimations successives de la dérivée
    (position et vitesse) afin d’obtenir une intégration plus précise du mouvement
    qu’avec une méthode simple comme Euler. Diminution de l'erreur de calcul et 
	permet une simulation bien plus précise qu'avec Euler bien qu'il y est quand même 
	de l'erreur qui fini par s'accumuler
	
	Paramètres :
		temps_dernier_ecran: temps simulé écoulé depuis la dernière frame
		k1 = dérivée au début du pas
		k2 = dérivée au milieu du pas (en avançant avec k1)
		k3 = dérivée au milieu du pas (en avançant avec k2)
		k4 = dérivée à la fin du pas (en avançant avec k3)
		r_i : La nouvelle position de l'astre
		v_i : la vitesse de l'astre à sa nouvelle position
	"""
	
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
	"""
	essentiel pour la rotation de neptune, sinon le slider fait buger la lune
	lorsque le slider va au dessus de 45 mois/seconde, Mercure se retrouve à s'arrèter soudainement
	Appel de toutes les fonctions essentiel à l'initialisation de la simulation
	"""
	interface_node = get_tree().get_first_node_in_group("interface")
	if interface_node:
		interface_node.connect("slider_changed", Callable(self, "_on_interface_slider_changed"))
	autres_corps = []
	for n in get_tree().get_nodes_in_group("corps"):
		if n is Node3D:
			autres_corps.append(n)
	autres_corps.erase(self)

	rotate_y(inclinaison)
	assignation_donnees_planete()
	initialiser_position_et_vitesse()
	changement_vitesse_lunes()
	
	min_distance_reelle = demi_grand_axe * (1.0 - excentricite)
	max_distance_reelle = demi_grand_axe * (1.0 + excentricite)

	for corps in autres_corps:
		if corps.name == parent_nom:
			parent_node = corps
			break
	
func _process(delta: float) -> void:
	"""
	Appelle des fonctions à chaque delta pour simuler le déplacement des astres 
	dans la simulation
	"""
	runge_kotta(delta * temps_sec_mois * vitesse_simu)
	# position en fonction du parent de l'astre (soleil ou planète spécifique)
	if parent_node != null:
		global_position = parent_node.global_position + conv_position_reelle_a_simulee(r_i)
	# calcul de la position si l'astre n'a pas de parent (soleil)
	else:
		global_position = conv_position_reelle_a_simulee(r_i)

signal Donnee_Astre(info)
@warning_ignore("unused_signal")

func _enter_tree():
	"""
	Ajoute l’astre au groupe 'corps' dès qu’il entre dans l’arbre de scène.
	
	Retour :
		Aucun.
	"""
	add_to_group("corps")


func emettre_donnees():
	"""
	Émet un signal contenant toutes les informations physiques et orbitales
	de l’astre, utilisé par l’interface lors d’un clic de l’utilisateur.

	Retour :
		Aucun.
	"""
	Donnee_Astre.emit({
		"nom":                          name,
		"demi_grand_axe":               demi_grand_axe,
		"excentricite":                 excentricite,
		"inclinaison":                  inclinaison,
		"argument_perihelie":           argument_perihelie,
		"perihelie":                    perihelie,
		"vitesse_perihelie":            vitesse_perihelie,
		"periode_orbitale":             periode_orbitale,
		"temps_rot_soleil":             temps_rot_soleil,
		"masse":                        masse,
		"rayon":                        rayon,
		"temps_rotation_sur_elle_meme": temps_rotation_sur_elle_meme,
		"parent":                       parent_nom
	})	
