extends Node3D

class_name donnees
"""
données fournies par l'intelligence artificielle
 en utilisant la base de données fournie par la NASA
"""
const donnee = [
  {
	"name": "Soleil",
	"mass": 1.989e+30,   # kg
	"a":    0,      # UA
	"e":    0,
	"i":    0,      # degrés
	"w":    0,      # arg. périhélie (degrés)
	"Omega":0,      # nœud ascendant (degrés)
	"T_rev":0,      # jours
	"v_peri":0,    # km/s
	"rot":  609.12,    # heures (négatif = rétrograde)
	"radius_vis":0.05 # UA (affichage Godot)
  },
  {
	"name": "Mercure",
	"mass": 3.302e+23,   # kg
	"a":    0.3871,      # UA
	"e":    0.20563,
	"i":    7.005,      # degrés
	"w":    29.124,      # arg. périhélie (degrés)
	"Omega":48.331,      # nœud ascendant (degrés)
	"T_rev":87.969,      # jours
	"v_peri":58.98,    # km/s
	"rot":  1407.6,    # heures (négatif = rétrograde)
	"radius_vis":0.003 # UA (affichage Godot)
  },
  {
	"name": "Vénus",
	"mass": 4.869e+24,   # kg
	"a":    0.72333,      # UA
	"e":    0.00677,
	"i":    3.395,      # degrés
	"w":    54.884,      # arg. périhélie (degrés)
	"Omega":76.68,      # nœud ascendant (degrés)
	"T_rev":224.701,      # jours
	"v_peri":35.26,    # km/s
	"rot":  -5832.5,    # heures (négatif = rétrograde)
	"radius_vis":0.005 # UA (affichage Godot)
  },
  {
	"name": "Terre",
	"mass": 5.972e+24,   # kg
	"a":    1,      # UA
	"e":    0.01671,
	"i":    0,      # degrés
	"w":    114.208,      # arg. périhélie (degrés)
	"Omega":0,      # nœud ascendant (degrés)
	"T_rev":365.256,      # jours
	"v_peri":30.29,    # km/s
	"rot":  23.934,    # heures (négatif = rétrograde)
	"radius_vis":0.006 # UA (affichage Godot)
  },
  {
	"name": "Mars",
	"mass": 6.419e+23,   # kg
	"a":    1.52366,      # UA
	"e":    0.09341,
	"i":    1.85,      # degrés
	"w":    286.502,      # arg. périhélie (degrés)
	"Omega":49.558,      # nœud ascendant (degrés)
	"T_rev":686.971,      # jours
	"v_peri":26.5,    # km/s
	"rot":  24.623,    # heures (négatif = rétrograde)
	"radius_vis":0.004 # UA (affichage Godot)
  },
  {
	"name": "Jupiter",
	"mass": 1.899e+27,   # kg
	"a":    5.20336,      # UA
	"e":    0.04839,
	"i":    1.303,      # degrés
	"w":    273.867,      # arg. périhélie (degrés)
	"Omega":100.464,      # nœud ascendant (degrés)
	"T_rev":4332.589,      # jours
	"v_peri":13.72,    # km/s
	"rot":  9.926,    # heures (négatif = rétrograde)
	"radius_vis":0.025 # UA (affichage Godot)
  },
  {
	"name": "Saturne",
	"mass": 5.685e+26,   # kg
	"a":    9.53707,      # UA
	"e":    0.05415,
	"i":    2.489,      # degrés
	"w":    339.392,      # arg. périhélie (degrés)
	"Omega":113.665,      # nœud ascendant (degrés)
	"T_rev":10759.22,      # jours
	"v_peri":10.18,    # km/s
	"rot":  10.656,    # heures (négatif = rétrograde)
	"radius_vis":0.02 # UA (affichage Godot)
  },
  {
	"name": "Uranus",
	"masse": 8.683e+25,   # kg
	"a":    19.19126,      # UA
	"e":    0.04717,
	"i":    0.773,      # degrés
	"w":    96.998,      # arg. périhélie (degrés)
	"Omega":74.006,      # nœud ascendant (degrés)
	"T_rev":30688.5,      # jours
	"v_peri":7.11,    # km/s
	"rot":  -17.24,    # heures (négatif = rétrograde)
	"radius_vis":0.015 # UA (affichage Godot)
  },
  {
	"name": "Neptune",
	"mass": 1.024e+26,   # kg
	"a":    30.06896,      # UA
	"e":    0.00859,
	"i":    1.77,      # degrés
	"w":    276.34,      # arg. périhélie (degrés)
	"Omega":131.784,      # nœud ascendant (degrés)
	"T_rev":60182,      # jours
	"v_peri":5.5,    # km/s
	"rot":  16.11,    # heures (négatif = rétrograde)
	"radius_vis":0.015 # UA (affichage Godot)
  },
]

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
