extends Node3D

class_name donnees
"""
données fournies par l'intelligence artificielle
en utilisant la base de données fournie par la NASA
"""

var DONNEES_CORPS := [
{"nom":"Soleil","parent":"Aucun","demi_grand_axe":0.0,"excentricite":0.0,"inclinaison":0.0,"argument_perihelie":0.0,"perihelie":0.0,"vitesse_perihelie":0.0,"periode_orbitale":0.0,"temps_rot_soleil":609.12,"masse":1.9884e30,"rayon":6.9634e8,"temps_rotation_sur_elle_meme":609.12},

{"nom":"Mercure","parent":"Soleil","demi_grand_axe":57.91e9,"excentricite":0.20563,"inclinaison":7.005,"argument_perihelie":29.124,"perihelie":46.00e9,"vitesse_perihelie":58.98,"periode_orbitale":87.969*86400.0,"temps_rot_soleil":0.0,"masse":3.302e23,"rayon":2.439e6,"temps_rotation_sur_elle_meme":1407.6},

{"nom":"Vénus","parent":"Soleil","demi_grand_axe":108.21e9,"excentricite":0.00677,"inclinaison":3.395,"argument_perihelie":54.884,"perihelie":107.48e9,"vitesse_perihelie":35.26,"periode_orbitale":224.701*86400.0,"temps_rot_soleil":0.0,"masse":4.869e24,"rayon":6.052e6,"temps_rotation_sur_elle_meme":-5832.5},

{"nom":"Terre","parent":"Soleil","demi_grand_axe":149.60e9,"excentricite":0.01671,"inclinaison":0.0,"argument_perihelie":114.208,"perihelie":147.10e9,"vitesse_perihelie":30.29,"periode_orbitale":365.256*86400.0,"temps_rot_soleil":0.0,"masse":5.972e24,"rayon":6.371e6,"temps_rotation_sur_elle_meme":23.934},

{"nom":"Lune","parent":"Terre","demi_grand_axe":384.4e6,"excentricite":0.0549,"inclinaison":5.145,"argument_perihelie":0.0,"perihelie":363.3e6,"vitesse_perihelie":0.0,"periode_orbitale":27.321661*86400.0,"temps_rot_soleil":0.0,"masse":7.342e22,"rayon":1.7374e6,"temps_rotation_sur_elle_meme":655.7},

{"nom":"Mars","parent":"Soleil","demi_grand_axe":227.94e9,"excentricite":0.09341,"inclinaison":1.85,"argument_perihelie":286.502,"perihelie":206.65e9,"vitesse_perihelie":26.5,"periode_orbitale":686.971*86400.0,"temps_rot_soleil":0.0,"masse":6.419e23,"rayon":3.389e6,"temps_rotation_sur_elle_meme":24.623},

{"nom":"Phobos","parent":"Mars","demi_grand_axe":9376e3,"excentricite":0.0151,"inclinaison":1.093,"argument_perihelie":0.0,"perihelie":0.0,"vitesse_perihelie":0.0,"periode_orbitale":0.31891*86400.0,"temps_rot_soleil":0.0,"masse":1.0659e16,"rayon":11266.0,"temps_rotation_sur_elle_meme":7.65},

{"nom":"Déimos","parent":"Mars","demi_grand_axe":23463e3,"excentricite":0.00033,"inclinaison":1.793,"argument_perihelie":0.0,"perihelie":0.0,"vitesse_perihelie":0.0,"periode_orbitale":1.26244*86400.0,"temps_rot_soleil":0.0,"masse":1.4762e15,"rayon":6200.0,"temps_rotation_sur_elle_meme":30.3},

{"nom":"Jupiter","parent":"Soleil","demi_grand_axe":778.57e9,"excentricite":0.04839,"inclinaison":1.303,"argument_perihelie":273.867,"perihelie":740.52e9,"vitesse_perihelie":13.72,"periode_orbitale":4332.589*86400.0,"temps_rot_soleil":0.0,"masse":1.899e27,"rayon":6.9911e7,"temps_rotation_sur_elle_meme":9.926},

{"nom":"Io","parent":"Jupiter","demi_grand_axe":421.8e6,"excentricite":0.0041,"inclinaison":0.036,"argument_perihelie":0.0,"perihelie":0.0,"vitesse_perihelie":0.0,"periode_orbitale":1.769*86400.0,"temps_rot_soleil":0.0,"masse":8.9319e22,"rayon":1.8216e6,"temps_rotation_sur_elle_meme":42.46},

{"nom":"Europe","parent":"Jupiter","demi_grand_axe":671.1e6,"excentricite":0.0094,"inclinaison":0.466,"argument_perihelie":0.0,"perihelie":0.0,"vitesse_perihelie":0.0,"periode_orbitale":3.551*86400.0,"temps_rot_soleil":0.0,"masse":4.7998e22,"rayon":1.5608e6,"temps_rotation_sur_elle_meme":85.23},

{"nom":"Ganymède","parent":"Jupiter","demi_grand_axe":1.0704e9,"excentricite":0.0013,"inclinaison":0.204,"argument_perihelie":0.0,"perihelie":0.0,"vitesse_perihelie":0.0,"periode_orbitale":7.1546*86400.0,"temps_rot_soleil":0.0,"masse":1.4819e23,"rayon":2.6341e6,"temps_rotation_sur_elle_meme":171.7},

{"nom":"Callisto","parent":"Jupiter","demi_grand_axe":1.8827e9,"excentricite":0.0074,"inclinaison":0.192,"argument_perihelie":0.0,"perihelie":0.0,"vitesse_perihelie":0.0,"periode_orbitale":16.689*86400.0,"temps_rot_soleil":0.0,"masse":1.0759e23,"rayon":2.4103e6,"temps_rotation_sur_elle_meme":400.5},
{"nom":"Saturne","parent":"Soleil","demi_grand_axe":1.43353e12,"excentricite":0.05415,"inclinaison":2.489,"argument_perihelie":339.392,"perihelie":1.35255e12,"vitesse_perihelie":10.18,"periode_orbitale":10759.22*86400.0,"temps_rot_soleil":0.0,"masse":5.685e26,"rayon":5.8232e7,"temps_rotation_sur_elle_meme":10.656},

{"nom":"Titan","parent":"Saturne","demi_grand_axe":1.22187e9,"excentricite":0.0288,"inclinaison":0.34854,"argument_perihelie":0.0,"perihelie":0.0,"vitesse_perihelie":0.0,"periode_orbitale":15.945*86400.0,"temps_rot_soleil":0.0,"masse":1.3452e23,"rayon":2.575e6,"temps_rotation_sur_elle_meme":382.7},

{"nom":"Encelade","parent":"Saturne","demi_grand_axe":238.02e6,"excentricite":0.0047,"inclinaison":0.009,"argument_perihelie":0.0,"perihelie":0.0,"vitesse_perihelie":0.0,"periode_orbitale":1.370*86400.0,"temps_rot_soleil":0.0,"masse":1.08e20,"rayon":252100.0,"temps_rotation_sur_elle_meme":32.9},

{"nom":"Mimas","parent":"Saturne","demi_grand_axe":185.54e6,"excentricite":0.0196,"inclinaison":1.574,"argument_perihelie":0.0,"perihelie":0.0,"vitesse_perihelie":0.0,"periode_orbitale":0.942*86400.0,"temps_rot_soleil":0.0,"masse":3.7493e19,"rayon":198200.0,"temps_rotation_sur_elle_meme":22.6},

{"nom":"Téthys","parent":"Saturne","demi_grand_axe":294.66e6,"excentricite":0.0001,"inclinaison":1.091,"argument_perihelie":0.0,"perihelie":0.0,"vitesse_perihelie":0.0,"periode_orbitale":1.888*86400.0,"temps_rot_soleil":0.0,"masse":6.174e20,"rayon":531100.0,"temps_rotation_sur_elle_meme":45.3},

{"nom":"Dioné","parent":"Saturne","demi_grand_axe":377.4e6,"excentricite":0.0022,"inclinaison":0.028,"argument_perihelie":0.0,"perihelie":0.0,"vitesse_perihelie":0.0,"periode_orbitale":2.737*86400.0,"temps_rot_soleil":0.0,"masse":1.095e21,"rayon":561400.0,"temps_rotation_sur_elle_meme":65.7},

{"nom":"Rhée","parent":"Saturne","demi_grand_axe":527.1e6,"excentricite":0.0010,"inclinaison":0.345,"argument_perihelie":0.0,"perihelie":0.0,"vitesse_perihelie":0.0,"periode_orbitale":4.518*86400.0,"temps_rot_soleil":0.0,"masse":2.306e21,"rayon":763800.0,"temps_rotation_sur_elle_meme":108.0},

{"nom":"Japet","parent":"Saturne","demi_grand_axe":3.5608e9,"excentricite":0.0283,"inclinaison":15.47,"argument_perihelie":0.0,"perihelie":0.0,"vitesse_perihelie":0.0,"periode_orbitale":79.3215*86400.0,"temps_rot_soleil":0.0,"masse":1.805e21,"rayon":734500.0,"temps_rotation_sur_elle_meme":1902.0},

{"nom":"Uranus","parent":"Soleil","demi_grand_axe":2.87246e12,"excentricite":0.04717,"inclinaison":0.773,"argument_perihelie":96.998,"perihelie":2.74099e12,"vitesse_perihelie":7.11,"periode_orbitale":30688.5*86400.0,"temps_rot_soleil":0.0,"masse":8.683e25,"rayon":2.5362e7,"temps_rotation_sur_elle_meme":-17.24},

{"nom":"Miranda","parent":"Uranus","demi_grand_axe":129.9e6,"excentricite":0.0013,"inclinaison":4.338,"argument_perihelie":0.0,"perihelie":0.0,"vitesse_perihelie":0.0,"periode_orbitale":1.413*86400.0,"temps_rot_soleil":0.0,"masse":6.59e19,"rayon":235800.0,"temps_rotation_sur_elle_meme":33.9},

{"nom":"Ariel","parent":"Uranus","demi_grand_axe":191.0e6,"excentricite":0.0012,"inclinaison":0.041,"argument_perihelie":0.0,"perihelie":0.0,"vitesse_perihelie":0.0,"periode_orbitale":2.520*86400.0,"temps_rot_soleil":0.0,"masse":1.353e21,"rayon":578900.0,"temps_rotation_sur_elle_meme":60.5},

{"nom":"Umbriel","parent":"Uranus","demi_grand_axe":266.0e6,"excentricite":0.0039,"inclinaison":0.128,"argument_perihelie":0.0,"perihelie":0.0,"vitesse_perihelie":0.0,"periode_orbitale":4.144*86400.0,"temps_rot_soleil":0.0,"masse":1.275e21,"rayon":584700.0,"temps_rotation_sur_elle_meme":99.5},

{"nom":"Titania","parent":"Uranus","demi_grand_axe":435.8e6,"excentricite":0.0011,"inclinaison":0.079,"argument_perihelie":0.0,"perihelie":0.0,"vitesse_perihelie":0.0,"periode_orbitale":8.706*86400.0,"temps_rot_soleil":0.0,"masse":3.527e21,"rayon":788900.0,"temps_rotation_sur_elle_meme":208.9},

{"nom":"Obéron","parent":"Uranus","demi_grand_axe":583.5e6,"excentricite":0.0014,"inclinaison":0.068,"argument_perihelie":0.0,"perihelie":0.0,"vitesse_perihelie":0.0,"periode_orbitale":13.463*86400.0,"temps_rot_soleil":0.0,"masse":3.014e21,"rayon":761400.0,"temps_rotation_sur_elle_meme":323.0},

{"nom":"Neptune","parent":"Soleil","demi_grand_axe":4.49506e12,"excentricite":0.00859,"inclinaison":1.77,"argument_perihelie":276.34,"perihelie":4.47699e12,"vitesse_perihelie":5.50,"periode_orbitale":60182.0*86400.0,"temps_rot_soleil":0.0,"masse":1.024e26,"rayon":2.4622e7,"temps_rotation_sur_elle_meme":16.11},

{"nom":"Triton","parent":"Neptune","demi_grand_axe":354.8e6,"excentricite":0.000016,"inclinaison":156.865,"argument_perihelie":0.0,"perihelie":0.0,"vitesse_perihelie":0.0,"periode_orbitale":5.877*86400.0,"temps_rot_soleil":0.0,"masse":2.14e22,"rayon":1.3534e6,"temps_rotation_sur_elle_meme":141.0},

{"nom":"Néréide","parent":"Neptune","demi_grand_axe":5.513e9,"excentricite":0.7512,"inclinaison":7.23,"argument_perihelie":0.0,"perihelie":0.0,"vitesse_perihelie":0.0,"periode_orbitale":360.13*86400.0,"temps_rot_soleil":0.0,"masse":3.1e19,"rayon":170000.0,"temps_rotation_sur_elle_meme":0.0},

{"nom":"Protée","parent":"Neptune","demi_grand_axe":117.6e6,"excentricite":0.0005,"inclinaison":0.524,"argument_perihelie":0.0,"perihelie":0.0,"vitesse_perihelie":0.0,"periode_orbitale":1.122*86400.0,"temps_rot_soleil":0.0,"masse":5.0e19,"rayon":210000.0,"temps_rotation_sur_elle_meme":0.0}
]
