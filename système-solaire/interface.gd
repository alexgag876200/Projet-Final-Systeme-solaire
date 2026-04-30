extends Control
class_name Interface

@export_group("Connection avec les autres noeuds et script") 
@export var slider_vitesse: HSlider
@export var label_nom: Label
@export var label_masse: Label
@export var label_v_peri: Label
@export var label_excentricite: Label
@export var label_periode_soleil: Label
@export var label_periode_astre: Label

var slider: float

func _ready() -> void:
	add_to_group("interface")  # ← ajoute cette ligne
	slider_vitesse.value = 3
	
func _process(_delta: float) -> void:
	pass

func _on_astre_clique(infos: Dictionary) -> void:
	label_nom.text          = "Nom : %s"              % infos["nom"]
	label_masse.text        = "Masse : %s kg"         % format_scientifique(infos["masse"])
	label_v_peri.text       = "V. périhélie : %s km/s" % format_scientifique(infos["vitesse_perihelie"])
	label_excentricite.text = "Excentricité : %.4f"   % infos["excentricite"]
	label_periode_soleil.text = "Rot. Soleil : %.2f j" % infos["temps_rot_soleil"]
	label_periode_astre.text  = "Période : %.2f j"    % infos["periode_orbitale"]

func slide_value() -> float:
	slider = slider_vitesse.value
	return slider

func format_scientifique(valeur: float) -> String:
	if valeur == 0.0:
		return "0.000e0"
	var signe = "-" if valeur < 0 else ""
	valeur = abs(valeur)
	var exposant = int(floor(log(valeur) / log(10)))
	var mantisse = valeur / pow(10, exposant)
	return signe + "%.3f" % mantisse + "e" + "%d" % exposant
