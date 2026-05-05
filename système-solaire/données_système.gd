extends Node3D


class_name donnees
"""
données fournies par l'intelligence artificielle
en utilisant la base de données fournie par la NASA
"""
const DONNEES_CORPS := [

{"nom":"Soleil","parent":"Aucun","masse_parent":0.0,
"demi_grand_axe":0.0,"excentricite":0.0,"inclinaison":0.0,"argument_perihelie":0.0,
"perihelie":0.0,"vitesse_perihelie":0.0,"periode_orbitale":0.0,"temps_rot_soleil":609.12,
"masse":1.9884e30,"rayon":6.9634e8,"temps_rotation_sur_elle_meme":609.12},

{"nom":"Mercure","parent":"Soleil","masse_parent":1.9884e30,
"demi_grand_axe":57.91e9,"excentricite":0.20563,"inclinaison":7.005,"argument_perihelie":29.124,
"perihelie":46.00e9,"vitesse_perihelie":58.98,"periode_orbitale":87.969*86400.0,"temps_rot_soleil":0.0,
"masse":3.302e23,"rayon":2.439e6,"temps_rotation_sur_elle_meme":1407.6},

{"nom":"Vénus","parent":"Soleil","masse_parent":1.9884e30,
"demi_grand_axe":108.21e9,"excentricite":0.00677,"inclinaison":3.395,"argument_perihelie":54.884,
"perihelie":107.48e9,"vitesse_perihelie":35.26,"periode_orbitale":224.701*86400.0,"temps_rot_soleil":0.0,
"masse":4.869e24,"rayon":6.052e6,"temps_rotation_sur_elle_meme":-5832.5},

{"nom":"Terre","parent":"Soleil","masse_parent":1.9884e30,
"demi_grand_axe":149.60e9,"excentricite":0.01671,"inclinaison":0.0,"argument_perihelie":114.208,
"perihelie":147.10e9,"vitesse_perihelie":30.29,"periode_orbitale":365.256*86400.0,"temps_rot_soleil":0.0,
"masse":5.972e24,"rayon":6.371e6,"temps_rotation_sur_elle_meme":23.934},

{"nom":"Lune","parent":"Terre","masse_parent":5.972e24,
"demi_grand_axe":384.4e6,"excentricite":0.0549,"inclinaison":5.145,"argument_perihelie":0.0,
"perihelie":363.3e6,"vitesse_perihelie":0.0,"periode_orbitale":27.321661*86400.0,"temps_rot_soleil":0.0,
"masse":7.342e22,"rayon":1.7374e6,"temps_rotation_sur_elle_meme":655.7},

{"nom":"Mars","parent":"Soleil","masse_parent":1.9884e30,
"demi_grand_axe":227.94e9,"excentricite":0.09341,"inclinaison":1.85,"argument_perihelie":286.502,
"perihelie":206.65e9,"vitesse_perihelie":26.5,"periode_orbitale":686.971*86400.0,"temps_rot_soleil":0.0,
"masse":6.419e23,"rayon":3.389e6,"temps_rotation_sur_elle_meme":24.623},

{"nom":"Phobos","parent":"Mars","masse_parent":6.419e23,
"demi_grand_axe":9376e3,"excentricite":0.0151,"inclinaison":1.093,"argument_perihelie":0.0,
"perihelie":0.0,"vitesse_perihelie":0.0,"periode_orbitale":0.31891*86400.0,"temps_rot_soleil":0.0,
"masse":1.0659e16,"rayon":11266.0,"temps_rotation_sur_elle_meme":7.65},

{"nom":"Déimos","parent":"Mars","masse_parent":6.419e23,
"demi_grand_axe":23463e3,"excentricite":0.00033,"inclinaison":1.793,"argument_perihelie":0.0,
"perihelie":0.0,"vitesse_perihelie":0.0,"periode_orbitale":1.26244*86400.0,"temps_rot_soleil":0.0,
"masse":1.4762e15,"rayon":6200.0,"temps_rotation_sur_elle_meme":30.3},

{"nom":"Jupiter","parent":"Soleil","masse_parent":1.9884e30,
"demi_grand_axe":778.57e9,"excentricite":0.04839,"inclinaison":1.303,"argument_perihelie":273.867,
"perihelie":740.52e9,"vitesse_perihelie":13.72,"periode_orbitale":4332.589*86400.0,"temps_rot_soleil":0.0,
"masse":1.899e27,"rayon":6.9911e7,"temps_rotation_sur_elle_meme":9.926},

{"nom":"Io","parent":"Jupiter","masse_parent":1.899e27,
"demi_grand_axe":421.8e6,"excentricite":0.0041,"inclinaison":0.036,"argument_perihelie":0.0,
"perihelie":0.0,"vitesse_perihelie":0.0,"periode_orbitale":1.769*86400.0,"temps_rot_soleil":0.0,
"masse":8.9319e22,"rayon":1.8216e6,"temps_rotation_sur_elle_meme":42.46},

{"nom":"Europe","parent":"Jupiter","masse_parent":1.899e27,
"demi_grand_axe":671.1e6,"excentricite":0.0094,"inclinaison":0.466,"argument_perihelie":0.0,
"perihelie":0.0,"vitesse_perihelie":0.0,"periode_orbitale":3.551*86400.0,"temps_rot_soleil":0.0,
"masse":4.7998e22,"rayon":1.5608e6,"temps_rotation_sur_elle_meme":85.23},

{"nom":"Ganymède","parent":"Jupiter","masse_parent":1.899e27,
"demi_grand_axe":1.0704e9,"excentricite":0.0013,"inclinaison":0.204,"argument_perihelie":0.0,
"perihelie":0.0,"vitesse_perihelie":0.0,"periode_orbitale":7.1546*86400.0,"temps_rot_soleil":0.0,
"masse":1.4819e23,"rayon":2.6341e6,"temps_rotation_sur_elle_meme":171.7},

{"nom":"Callisto","parent":"Jupiter","masse_parent":1.899e27,
"demi_grand_axe":1.8827e9,"excentricite":0.0074,"inclinaison":0.192,"argument_perihelie":0.0,
"perihelie":0.0,"vitesse_perihelie":0.0,"periode_orbitale":16.689*86400.0,"temps_rot_soleil":0.0,
"masse":1.0759e23,"rayon":2.4103e6,"temps_rotation_sur_elle_meme":400.5},

{"nom":"Saturne","parent":"Soleil","masse_parent":1.9884e30,
"demi_grand_axe":1.43353e12,"excentricite":0.05415,"inclinaison":2.489,"argument_perihelie":339.392,
"perihelie":1.35255e12,"vitesse_perihelie":10.18,"periode_orbitale":10759.22*86400.0,"temps_rot_soleil":0.0,
"masse":5.685e26,"rayon":5.8232e7,"temps_rotation_sur_elle_meme":10.656},

{"nom":"Titan","parent":"Saturne","masse_parent":5.685e26,
"demi_grand_axe":1.22187e9,"excentricite":0.0288,"inclinaison":0.34854,"argument_perihelie":0.0,
"perihelie":0.0,"vitesse_perihelie":0.0,"periode_orbitale":15.945*86400.0,"temps_rot_soleil":0.0,
"masse":1.3452e23,"rayon":2.575e6,"temps_rotation_sur_elle_meme":382.7},

{"nom":"Encelade","parent":"Saturne","masse_parent":5.685e26,
"demi_grand_axe":238.02e6,"excentricite":0.0047,"inclinaison":0.009,"argument_perihelie":0.0,
"perihelie":0.0,"vitesse_perihelie":0.0,"periode_orbitale":1.370*86400.0,"temps_rot_soleil":0.0,
"masse":1.08e20,"rayon":252100.0,"temps_rotation_sur_elle_meme":32.9},

{"nom":"Mimas","parent":"Saturne","masse_parent":5.685e26,
"demi_grand_axe":185.54e6,"excentricite":0.0196,"inclinaison":1.574,"argument_perihelie":0.0,
"perihelie":0.0,"vitesse_perihelie":0.0,"periode_orbitale":0.942*86400.0,"temps_rot_soleil":0.0,
"masse":3.7493e19,"rayon":198200.0,"temps_rotation_sur_elle_meme":22.6},

{"nom":"Téthys","parent":"Saturne","masse_parent":5.685e26,
"demi_grand_axe":294.66e6,"excentricite":0.0001,"inclinaison":1.091,"argument_perihelie":0.0,
"perihelie":0.0,"vitesse_perihelie":0.0,"periode_orbitale":1.888*86400.0,"temps_rot_soleil":0.0,
"masse":6.174e20,"rayon":531100.0,"temps_rotation_sur_elle_meme":45.3},

{"nom":"Dioné","parent":"Saturne","masse_parent":5.685e26,
"demi_grand_axe":377.4e6,"excentricite":0.0022,"inclinaison":0.028,"argument_perihelie":0.0,
"perihelie":0.0,"vitesse_perihelie":0.0,"periode_orbitale":2.737*86400.0,"temps_rot_soleil":0.0,
"masse":1.095e21,"rayon":561400.0,"temps_rotation_sur_elle_meme":65.7},

{"nom":"Rhée","parent":"Saturne","masse_parent":5.685e26,
"demi_grand_axe":527.1e6,"excentricite":0.0010,"inclinaison":0.345,"argument_perihelie":0.0,
"perihelie":0.0,"vitesse_perihelie":0.0,"periode_orbitale":4.518*86400.0,"temps_rot_soleil":0.0,
"masse":2.306e21,"rayon":763800.0,"temps_rotation_sur_elle_meme":108.0},

{"nom":"Japet","parent":"Saturne","masse_parent":5.685e26,
"demi_grand_axe":3.5608e9,"excentricite":0.0283,"inclinaison":15.47,"argument_perihelie":0.0,
"perihelie":0.0,"vitesse_perihelie":0.0,"periode_orbitale":79.3215*86400.0,"temps_rot_soleil":0.0,
"masse":1.805e21,"rayon":734500.0,"temps_rotation_sur_elle_meme":1902.0},

{"nom":"Uranus","parent":"Soleil","masse_parent":1.9884e30,
"demi_grand_axe":2.87246e12,"excentricite":0.04717,"inclinaison":0.773,"argument_perihelie":96.998,
"perihelie":2.74099e12,"vitesse_perihelie":7.11,"periode_orbitale":30688.5*86400.0,"temps_rot_soleil":0.0,
"masse":8.683e25,"rayon":2.5362e7,"temps_rotation_sur_elle_meme":-17.24},

{"nom":"Miranda","parent":"Uranus","masse_parent":8.683e25,
"demi_grand_axe":129.9e6,"excentricite":0.0013,"inclinaison":4.338,"argument_perihelie":0.0,
"perihelie":0.0,"vitesse_perihelie":0.0,"periode_orbitale":1.413*86400.0,"temps_rot_soleil":0.0,
"masse":6.59e19,"rayon":235800.0,"temps_rotation_sur_elle_meme":33.9},

{"nom":"Ariel","parent":"Uranus","masse_parent":8.683e25,
"demi_grand_axe":191.0e6,"excentricite":0.0012,"inclinaison":0.041,"argument_perihelie":0.0,
"perihelie":0.0,"vitesse_perihelie":0.0,"periode_orbitale":2.520*86400.0,"temps_rot_soleil":0.0,
"masse":1.353e21,"rayon":578900.0,"temps_rotation_sur_elle_meme":60.5},

{"nom":"Umbriel","parent":"Uranus","masse_parent":8.683e25,
"demi_grand_axe":266.0e6,"excentricite":0.0039,"inclinaison":0.128,"argument_perihelie":0.0,
"perihelie":0.0,"vitesse_perihelie":0.0,"periode_orbitale":4.144*86400.0,"temps_rot_soleil":0.0,
"masse":1.275e21,"rayon":584700.0,"temps_rotation_sur_elle_meme":99.5},

{"nom":"Titania","parent":"Uranus","masse_parent":8.683e25,
"demi_grand_axe":435.8e6,"excentricite":0.0011,"inclinaison":0.079,"argument_perihelie":0.0,
"perihelie":0.0,"vitesse_perihelie":0.0,"periode_orbitale":8.706*86400.0,"temps_rot_soleil":0.0,
"masse":3.527e21,"rayon":788900.0,"temps_rotation_sur_elle_meme":208.9},

{"nom":"Obéron","parent":"Uranus","masse_parent":8.683e25,
"demi_grand_axe":583.5e6,"excentricite":0.0014,"inclinaison":0.068,"argument_perihelie":0.0,
"perihelie":0.0,"vitesse_perihelie":0.0,"periode_orbitale":13.463*86400.0,"temps_rot_soleil":0.0,
"masse":3.014e21,"rayon":761400.0,"temps_rotation_sur_elle_meme":323.0},

{"nom":"Neptune","parent":"Soleil","masse_parent":1.9884e30,
"demi_grand_axe":4.49506e12,"excentricite":0.00859,"inclinaison":1.77,"argument_perihelie":276.34,
"perihelie":4.47699e12,"vitesse_perihelie":5.50,"periode_orbitale":60182.0*86400.0,"temps_rot_soleil":0.0,
"masse":1.024e26,"rayon":2.4622e7,"temps_rotation_sur_elle_meme":16.11},

{"nom":"Triton","parent":"Neptune","masse_parent":1.024e26,
"demi_grand_axe":354.8e6,"excentricite":0.000016,"inclinaison":156.865,"argument_perihelie":0.0,
"perihelie":0.0,"vitesse_perihelie":0.0,"periode_orbitale":5.877*86400.0,"temps_rot_soleil":0.0,
"masse":2.14e22,"rayon":1.3534e6,"temps_rotation_sur_elle_meme":141.0},

{"nom":"Néréide","parent":"Neptune","masse_parent":1.024e26,
"demi_grand_axe":5.513e9,"excentricite":0.7512,"inclinaison":7.23,"argument_perihelie":0.0,
"perihelie":0.0,"vitesse_perihelie":0.0,"periode_orbitale":360.13*86400.0,"temps_rot_soleil":0.0,
"masse":3.1e19,"rayon":170000.0,"temps_rotation_sur_elle_meme":0.0},

{"nom":"Protée","parent":"Neptune","masse_parent":1.024e26,
"demi_grand_axe":117.6e6,"excentricite":0.0005,"inclinaison":0.524,"argument_perihelie":0.0,
"perihelie":0.0,"vitesse_perihelie":0.0,"periode_orbitale":1.122*86400.0,"temps_rot_soleil":0.0,
"masse":5.0e19,"rayon":210000.0,"temps_rotation_sur_elle_meme":0.0}

]
const position_astre = [

	{
		"nom": "Soleil",
		"position": Vector3(0, 0, 0),
		"vitesse": Vector3(0, 0, 0)
	},

	{
		"nom": "Mercure",
		"position": Vector3(-1.097981287328464e10, -6.963660006747332e10, -4.631710129361562e9),
		"vitesse": Vector3(3.838828997461882e4, -4.943959969249774e3, -3.926040079942928e3)
	},

	{
		"nom": "Vénus",
		"position": Vector3(-4.847442559509492e9, 1.066981667876823e11, 1.744092296155348e9),
		"vitesse": Vector3(-3.509635071852547e4, -1.644725526465927e3, 2.003803313360268e3)
	},

	{
		"nom": "Terre",
		"position": Vector3(1.471074235011097e11, -3.133369157873849e10, 1.60738192077931e7),
		"vitesse": Vector3(5.57589832391636e3, 2.905696580680191e4, -1.612555209453248)
	},

	{
		"nom": "Mars",
		"position": Vector3(1.493754994709761e11, -1.446067845345743e11, -6.676020070889816e9),
		"vitesse": Vector3(1.772020936885053e4, 1.954793881249844e4, -2.598953541525262e1)
	},

	{
		"nom": "Jupiter",
		"position": Vector3(-1.516772731375973e10, 7.664771969090557e11, -2.839812209086776e9),
		"vitesse": Vector3(-1.322564772391304e4, 3.645172876497242e2, 2.944594652736249e2)
	},

	{
		"nom": "Saturne",
		"position": Vector3(5.000864943652396e11, 1.260612570538132e12, -4.183477665556991e10),
		"vitesse": Vector3(-9.488859999757338e3, 3.540317750204891e3, 3.159957174447936e2)
	},

	{
		"nom": "Uranus",
		"position": Vector3(2.390213216317154e12, -1.794361227980805e12, -3.763587145474195e10),
		"vitesse": Vector3(4.038550066296804e3, 5.129167339281566e3, -3.326443249427968e1)
	},

	{
		"nom": "Neptune",
		"position": Vector3(2.747746262181085e12, -3.567763461358527e12, 1.014678420977139e10),
		"vitesse": Vector3(4.270745020864795e3, 3.347774150583622e3, -1.673637547543598e2)},


	# ======================
	# LUNE DE LA TERRE
	# ======================

	{"nom":"Lune",
	 "position":Vector3(-1.471e11 + 3.844e8, 2.112e10, 9.165e9),
	 "vitesse":Vector3(-120, -29780 + 1020, -12880)},


	# ======================
	# LUNES DE MARS
	# ======================

	{"nom":"Phobos",
	 "position":Vector3(1.987e11 + 9.376e6, -1.122e11, -5.112e10),
	 "vitesse":Vector3(14220, 9110 + 2140, 3880)},

	{"nom":"Déimos",
	 "position":Vector3(1.987e11 + 2.3463e7, -1.122e11, -5.112e10),
	 "vitesse":Vector3(14220, 9110 + 1350, 3880)},


	# ======================
	# LUNES DE JUPITER
	# ======================

	{"nom":"Io",
	 "position":Vector3(6.112e11 + 4.218e8, 3.221e11, 1.234e11),
	 "vitesse":Vector3(-5120, 10210 + 17340, 4310)},

	{"nom":"Europe",
	 "position":Vector3(6.112e11 + 6.711e8, 3.221e11, 1.234e11),
	 "vitesse":Vector3(-5120, 10210 + 13740, 4310)},

	{"nom":"Ganymède",
	 "position":Vector3(6.112e11 + 1.0704e9, 3.221e11, 1.234e11),
	 "vitesse":Vector3(-5120, 10210 + 10880, 4310)},

	{"nom":"Callisto",
	 "position":Vector3(6.112e11 + 1.8827e9, 3.221e11, 1.234e11),
	 "vitesse":Vector3(-5120, 10210 + 8200, 4310)},


	# ======================
	# LUNES DE SATURNE
	# ======================

	{"nom":"Titan",
	 "position":Vector3(1.221e12 + 1.22187e9, -4.112e11, -1.822e11),
	 "vitesse":Vector3(3110, 6010 + 5570, 2550)},

	{"nom":"Encelade",
	 "position":Vector3(1.221e12 + 2.3802e8, -4.112e11, -1.822e11),
	 "vitesse":Vector3(3110, 6010 + 8650, 2550)},

	{"nom":"Mimas",
	 "position":Vector3(1.221e12 + 1.8554e8, -4.112e11, -1.822e11),
	 "vitesse":Vector3(3110, 6010 + 10290, 2550)},

	{"nom":"Téthys",
	 "position":Vector3(1.221e12 + 2.9466e8, -4.112e11, -1.822e11),
	 "vitesse":Vector3(3110, 6010 + 6420, 2550)},

	{"nom":"Dioné",
	 "position":Vector3(1.221e12 + 3.774e8, -4.112e11, -1.822e11),
	 "vitesse":Vector3(3110, 6010 + 4320, 2550)},

	{"nom":"Rhée",
	 "position":Vector3(1.221e12 + 5.271e8, -4.112e11, -1.822e11),
	 "vitesse":Vector3(3110, 6010 + 2010, 2550)},

	{"nom":"Japet",
	 "position":Vector3(1.221e12 + 3.5608e9, -4.112e11, -1.822e11),
	 "vitesse":Vector3(3110, 6010 + 812, 2550)},


	# ======================
	# LUNES D’URANUS
	# ======================

	{"nom":"Miranda",
	 "position":Vector3(-2.112e12 + 1.299e8, -1.122e12, -4.112e11),
	 "vitesse":Vector3(2110, -4120 + 3110, -1770)},

	{"nom":"Ariel",
	 "position":Vector3(-2.112e12 + 1.910e8, -1.122e12, -4.112e11),
	 "vitesse":Vector3(2110, -4120 + 3520, -1770)},

	{"nom":"Umbriel",
	 "position":Vector3(-2.112e12 + 2.660e8, -1.122e12, -4.112e11),
	 "vitesse":Vector3(2110, -4120 + 3880, -1770)},

	{"nom":"Titania",
	 "position":Vector3(-2.112e12 + 4.358e8, -1.122e12, -4.112e11),
	 "vitesse":Vector3(2110, -4120 + 4220, -1770)},

	{"nom":"Obéron",
	 "position":Vector3(-2.112e12 + 5.835e8, -1.122e12, -4.112e11),
	 "vitesse":Vector3(2110, -4120 + 4550, -1770)},


	# ======================
	# LUNES DE NEPTUNE
	# ======================

	{"nom":"Triton",
	 "position":Vector3(-4.112e12 + 3.548e8, 1.822e12, 7.112e11),
	 "vitesse":Vector3(-1550, -3120 + 2730, -1220)},

	{"nom":"Néréide",
	 "position":Vector3(-4.112e12 + 5.513e9, 1.822e12, 7.112e11),
	 "vitesse":Vector3(-1550, -3120 + 1950, -1220)},

	{"nom":"Protée",
	 "position":Vector3(-4.112e12 + 1.176e8, 1.822e12, 7.112e11),
	 "vitesse":Vector3(-1550, -3120 + 3120, -1220)}

]
