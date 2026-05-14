extends Control


@export_group("Connection avec les autres noeuds et script") 
@export var slider_vitesse: HSlider
@export var label_nom: Label
@export var label_masse: Label
@export var label_v_peri: Label
@export var label_excentricite: Label
@export var label_periode_soleil: Label
@export var label_periode_astre: Label
@export var label_slider_value: Label

var slider: float
signal slider_changed(value: float)

func _ready() -> void:
	"""
	Initialise l’interface utilisateur au démarrage et
	le slider, puis relie son signal à la fonction changement et 
	connecte automatiquement les signaux infos des astres pour 
	mettre à jour l’interface lors d’une sélection.
	
	Retour :
		Aucun.
	"""
	add_to_group("interface")
	slider_vitesse.value = 1
	slider_vitesse.value_changed.connect(changement)
	for node in get_tree().get_nodes_in_group("corps"):
		if node.has_signal("infos_vers_interface"):
			node.connect("infos_vers_interface", Callable(self, "_on_astre_clique"))
	

func changement(value: float):
	"""
	Callback appelé lorsque la valeur du slider change il
	émet un signal pour informer tous les astres.
	
	Paramètres :
		Nouvelle valeur du slider.
	
	Retour :
		Aucun.
	"""
	emit_signal("slider_changed", value)
	label_slider_value.text = "Vitesse: %.2f mois/s" % value


func slide_value() -> float:
	"""
	Retourne la valeur actuelle du slider de vitesse en float.
	
	Retour :
		Valeur actuelle du slider.
	"""
	slider = slider_vitesse.value
	return slider

func format_scientifique(valeur: float) -> String:
	"""
	Convertit une valeur numérique en notation scientifique sous forme de chaîne.
	
	Paramètres :
		Valeur à convertir.

	Retour :
		Représentation en notation scientifique.
    """
	if valeur == 0.0:
		return "0.000e0"
	var signe = "-" if valeur < 0 else ""
	valeur = abs(valeur)
	var exposant = int(floor(log(valeur) / log(10)))
	var mantisse = valeur / (10.0**exposant)
	return signe + "%.3f" % mantisse + "e" + "%d" % exposant


func _on_soleil_infos_astre(infos: Dictionary) -> void:
	"""
	Met à jour les labels de l’interface avec les informations
	reçues du Soleil qui a été sélectionné par l’utilisateur.
	
	Paramètres :
	infos (Dictionary) envoyés par l'astre
	
	Retour :
		Aucun.
	"""
	label_nom.text          = "Nom : %s"              % infos["nom"]
	label_masse.text        = "Masse : %s kg"         % format_scientifique(infos["masse"])
	label_v_peri.text       = "V. périhélie : 0 m/s"
	label_excentricite.text = "Excentricité : %.4f"   % infos["excentricite"]
	label_periode_soleil.text = "Période de révolution autour du soleil : %.2f jours" % (infos["periode_orbitale"]/86400)
	label_periode_astre.text  = "Période de rotation sur lui-même : %.2f h"    % infos["temps_rotation_sur_elle_meme"]


func _on_jupiter_donnee_astre(infos: Dictionary) -> void:
	"""
	Met à jour les labels de l’interface avec les informations
	reçues de Jupiter qui a été sélectionné par l’utilisateur.
	
	Paramètres :
	infos (Dictionary) envoyés par l'astre
	
	Retour :
		Aucun.
	"""
	label_nom.text          = "Nom : %s"              % infos["nom"]
	label_masse.text        = "Masse : %s kg"         % format_scientifique(infos["masse"])
	label_v_peri.text       = "V. périhélie : %s m/s" % format_scientifique(infos["vitesse_perihelie"])
	label_excentricite.text = "Excentricité : %.4f"   % infos["excentricite"]
	label_periode_soleil.text = "Période de révolution autour du soleil : %.2f jours" % (infos["periode_orbitale"] /86400)
	label_periode_astre.text  = "Période de rotation sur lui-même : %.2f h"    % infos["temps_rotation_sur_elle_meme"]


func _on_mars_donnee_astre(infos: Dictionary) -> void:
	"""
	Met à jour les labels de l’interface avec les informations
	reçues de Mars qui a été sélectionné par l’utilisateur.
	
	Paramètres :
	infos (Dictionary) envoyés par l'astre
	
	Retour :
		Aucun.
	"""
	label_nom.text          = "Nom : %s"              % infos["nom"]
	label_masse.text        = "Masse : %s kg"         % format_scientifique(infos["masse"])
	label_v_peri.text       = "V. périhélie : %s m/s" % format_scientifique(infos["vitesse_perihelie"])
	label_excentricite.text = "Excentricité : %.4f"   % infos["excentricite"]
	label_periode_soleil.text = "Période de révolution autour du soleil : %.2f jours" % (infos["periode_orbitale"] /86400)
	label_periode_astre.text  = "Période de rotation sur lui-même : %.2f h"    % infos["temps_rotation_sur_elle_meme"]


func _on_mercure_donnee_astre(infos: Dictionary) -> void:
	"""
	Met à jour les labels de l’interface avec les informations
	reçues de Mercure qui a été sélectionné par l’utilisateur.
	
	Paramètres :
	infos (Dictionary) envoyés par l'astre
	
	Retour :
		Aucun.
	"""
	label_nom.text          = "Nom : %s"              % infos["nom"]
	label_masse.text        = "Masse : %s kg"         % format_scientifique(infos["masse"])
	label_v_peri.text       = "V. périhélie : %s m/s" % format_scientifique(infos["vitesse_perihelie"])
	label_excentricite.text = "Excentricité : %.4f"   % infos["excentricite"]
	label_periode_soleil.text = "Période de révolution autour du soleil : %.2f jours" % (infos["periode_orbitale"] /86400)
	label_periode_astre.text  = "Période de rotation sur lui-même : %.2f h"    % infos["temps_rotation_sur_elle_meme"]


func _on_neptune_donnee_astre(infos: Dictionary) -> void:
	"""
	Met à jour les labels de l’interface avec les informations
	reçues de Neptune qui a été sélectionné par l’utilisateur.
	
	Paramètres :
	infos (Dictionary) envoyés par l'astre
	
	Retour :
		Aucun.
	"""
	label_nom.text          = "Nom : %s"              % infos["nom"]
	label_masse.text        = "Masse : %s kg"         % format_scientifique(infos["masse"])
	label_v_peri.text       = "V. périhélie : %s m/s" % format_scientifique(infos["vitesse_perihelie"])
	label_excentricite.text = "Excentricité : %.4f"   % infos["excentricite"]
	label_periode_soleil.text = "Période de révolution autour du soleil : %.2f jours" % (infos["periode_orbitale"] /86400)
	label_periode_astre.text  = "Période de rotation sur lui-même : %.2f h"    % infos["temps_rotation_sur_elle_meme"]


func _on_saturne_donnee_astre(infos: Dictionary) -> void:
	"""
	Met à jour les labels de l’interface avec les informations
	reçues de Saturne qui a été sélectionné par l’utilisateur.
	
	Paramètres :
	infos (Dictionary) envoyés par l'astre
	
	Retour :
		Aucun.
	"""
	label_nom.text          = "Nom : %s"              % infos["nom"]
	label_masse.text        = "Masse : %s kg"         % format_scientifique(infos["masse"])
	label_v_peri.text       = "V. périhélie : %s m/s" % format_scientifique(infos["vitesse_perihelie"])
	label_excentricite.text = "Excentricité : %.4f"   % infos["excentricite"]
	label_periode_soleil.text = "Période de révolution autour du soleil : %.2f jours" % (infos["periode_orbitale"] /86400)
	label_periode_astre.text  = "Période de rotation sur lui-même : %.2f h"    % infos["temps_rotation_sur_elle_meme"]


func _on_lune_donnee_astre(infos: Dictionary) -> void:
	"""
	Met à jour les labels de l’interface avec les informations
	reçues de la Lune qui a été sélectionné par l’utilisateur.
	
	Paramètres :
	infos (Dictionary) envoyés par l'astre
	
	Retour :
		Aucun.
	"""
	label_nom.text          = "Nom : %s"              % infos["nom"]
	label_masse.text        = "Masse : %s kg"         % format_scientifique(infos["masse"])
	label_v_peri.text       = "V. périhélie : %s m/s" % format_scientifique(infos["vitesse_perihelie"])
	label_excentricite.text = "Excentricité : %.4f"   % infos["excentricite"]
	label_periode_soleil.text = "Période de révolution autour du soleil : %.2f jours" % (infos["periode_orbitale"] /86400)
	label_periode_astre.text  = "Période de rotation sur lui-même : %.2f h"    % infos["temps_rotation_sur_elle_meme"]


func _on_terre_donnee_astre(infos: Dictionary) -> void:
	"""
	Met à jour les labels de l’interface avec les informations
	reçues de la Terre qui a été sélectionné par l’utilisateur.
	
	Paramètres :
	infos (Dictionary) envoyés par l'astre


	Retour :
		Aucun.
	"""
	label_nom.text          = "Nom : %s"              % infos["nom"]
	label_masse.text        = "Masse : %s kg"         % format_scientifique(infos["masse"])
	label_v_peri.text       = "V. périhélie : %s m/s" % format_scientifique(infos["vitesse_perihelie"])
	label_excentricite.text = "Excentricité : %.4f"   % infos["excentricite"]
	label_periode_soleil.text = "Période de révolution autour du soleil : %.2f jours" % (infos["periode_orbitale"] /86400)
	label_periode_astre.text  = "Période de rotation sur lui-même : %.2f h"    % infos["temps_rotation_sur_elle_meme"]


func _on_vénus_donnee_astre(infos: Dictionary) -> void:
	"""
	Met à jour les labels de l’interface avec les informations
	reçues du Vénus qui a été sélectionné par l’utilisateur.
	
	Paramètres :
	infos (Dictionary) envoyés par l'astre
	
	Retour :
		Aucun.
	"""
	label_nom.text          = "Nom : %s"              % infos["nom"]
	label_masse.text        = "Masse : %s kg"         % format_scientifique(infos["masse"])
	label_v_peri.text       = "V. périhélie : %s m/s" % format_scientifique(infos["vitesse_perihelie"])
	label_excentricite.text = "Excentricité : %.4f"   % infos["excentricite"]
	label_periode_soleil.text = "Période de révolution autour du soleil : %.2f jours" % (infos["periode_orbitale"] /86400)
	label_periode_astre.text  = "Période de rotation sur lui-même : %.2f h"    % infos["temps_rotation_sur_elle_meme"]


func _on_uranus_donnee_astre(infos: Dictionary) -> void:
	"""
	Met à jour les labels de l’interface avec les informations
	reçues de Uranus qui a été sélectionné par l’utilisateur.
	
	Paramètres :
	infos (Dictionary) envoyés par l'astre
	
	Retour :
		Aucun.
	"""
	label_nom.text          = "Nom : %s"              % infos["nom"]
	label_masse.text        = "Masse : %s kg"         % format_scientifique(infos["masse"])
	label_v_peri.text       = "V. périhélie : %s m/s" % format_scientifique(infos["vitesse_perihelie"])
	label_excentricite.text = "Excentricité : %.4f"   % infos["excentricite"]
	label_periode_soleil.text = "Période de révolution autour du soleil : %.2f jours" % (infos["periode_orbitale"] /86400)
	label_periode_astre.text  = "Période de rotation sur lui-même : %.2f h"    % infos["temps_rotation_sur_elle_meme"]
