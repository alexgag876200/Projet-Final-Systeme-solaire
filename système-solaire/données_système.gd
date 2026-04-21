extends Node3D

class_name donnees
"""
données fournies par l'intelligence artificielle
 en utilisant la base de données fournie par la NASA
"""
const DONNEES_CORPS := [

# =======================
# SOLEIL
# =======================
{
	"nom": "Soleil",

	# Éléments orbitaux (non pertinents, mais présents)
	"demi_grand_axe": 0.0,
	"excentricite": 0.0,
	"inclinaison": 0.0,
	"argument_perihelie": 0.0,
	"perihelie": 0.0,
	"vitesse_perihelie": 0.0,
	"periode_orbitale": 0.0,
	"temps_rot_soleil": 609.12, # heures

	# Propriétés physiques
	"masse": 1.9884e30,
	"rayon": 6.9634e8,
	"temps_rotation_sur_elle_meme": 609.12
},

# =======================
# MERCURE
# =======================
{
	"nom": "Mercure",
	"demi_grand_axe": 57.91e9,
	"excentricite": 0.20563,
	"inclinaison": 7.005,
	"argument_perihelie": 29.124,
	"perihelie": 46.00e9,
	"vitesse_perihelie": 58.98,
	"periode_orbitale": 87.969 * 86400.0,
	"temps_rot_soleil": 0.0,

	"masse": 3.302e23,
	"rayon": 2.439e6,
	"temps_rotation_sur_elle_meme": 1407.6
},

# =======================
# VÉNUS
# =======================
{
	"nom": "Vénus",
	"demi_grand_axe": 108.21e9,
	"excentricite": 0.00677,
	"inclinaison": 3.395,
	"argument_perihelie": 54.884,
	"perihelie": 107.48e9,
	"vitesse_perihelie": 35.26,
	"periode_orbitale": 224.701 * 86400.0,
	"temps_rot_soleil": 0.0,

	"masse": 4.869e24,
	"rayon": 6.052e6,
	"temps_rotation_sur_elle_meme": -5832.5 # rétrograde
},

# =======================
# TERRE
# =======================
{
	"nom": "Terre",
	"demi_grand_axe": 149.60e9,
	"excentricite": 0.01671,
	"inclinaison": 0.0,
	"argument_perihelie": 114.208,
	"perihelie": 147.10e9,
	"vitesse_perihelie": 30.29,
	"periode_orbitale": 365.256 * 86400.0,
	"temps_rot_soleil": 0.0,

	"masse": 5.972e24,
	"rayon": 6.371e6,
	"temps_rotation_sur_elle_meme": 23.934
},

# =======================
# MARS
# =======================
{
	"nom": "Mars",
	"demi_grand_axe": 227.94e9,
	"excentricite": 0.09341,
	"inclinaison": 1.85,
	"argument_perihelie": 286.502,
	"perihelie": 206.65e9,
	"vitesse_perihelie": 26.5,
	"periode_orbitale": 686.971 * 86400.0,
	"temps_rot_soleil": 0.0,

	"masse": 6.419e23,
	"rayon": 3.389e6,
	"temps_rotation_sur_elle_meme": 24.623
},

# =======================
# JUPITER
# =======================
{
	"nom": "Jupiter",
	"demi_grand_axe": 778.57e9,
	"excentricite": 0.04839,
	"inclinaison": 1.303,
	"argument_perihelie": 273.867,
	"perihelie": 740.52e9,
	"vitesse_perihelie": 13.72,
	"periode_orbitale": 4332.589 * 86400.0,
	"temps_rot_soleil": 0.0,

	"masse": 1.899e27,
	"rayon": 6.9911e7,
	"temps_rotation_sur_elle_meme": 9.926
},

# =======================
# SATURNE
# =======================
{
	"nom": "Saturne",
	"demi_grand_axe": 1.43353e12,
	"excentricite": 0.05415,
	"inclinaison": 2.489,
	"argument_perihelie": 339.392,
	"perihelie": 1.35255e12,
	"vitesse_perihelie": 10.18,
	"periode_orbitale": 10759.22 * 86400.0,
	"temps_rot_soleil": 0.0,

	"masse": 5.685e26,
	"rayon": 5.8232e7,
	"temps_rotation_sur_elle_meme": 10.656
},

# =======================
# URANUS
# =======================
{
	"nom": "Uranus",
	"demi_grand_axe": 2.87246e12,
	"excentricite": 0.04717,
	"inclinaison": 0.773,
	"argument_perihelie": 96.998,
	"perihelie": 2.74099e12,
	"vitesse_perihelie": 7.11,
	"periode_orbitale": 30688.5 * 86400.0,
	"temps_rot_soleil": 0.0,

	"masse": 8.683e25,
	"rayon": 2.5362e7,
	"temps_rotation_sur_elle_meme": -17.24 # axe incliné / rétrograde
},

# =======================
# NEPTUNE
# =======================
{
	"nom": "Neptune",
	"demi_grand_axe": 4.49506e12,
	"excentricite": 0.00859,
	"inclinaison": 1.77,
	"argument_perihelie": 276.34,
	"perihelie": 4.47699e12,
	"vitesse_perihelie": 5.50,
	"periode_orbitale": 60182.0 * 86400.0,
	"temps_rot_soleil": 0.0,

	"masse": 1.024e26,
	"rayon": 2.4622e7,
	"temps_rotation_sur_elle_meme": 16.11
}

]
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
