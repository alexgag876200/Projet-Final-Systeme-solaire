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

	{"nom": "Soleil",
	"position": Vector3(
		-3.762724995076578e8,
		-8.300384806386464e8,
		 1.583955990265432e7
	),
	"vitesse": Vector3(
		 1.499919218300715e1,
		-1.868214040737123e0,
		-3.655461613515212e-1
	)
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
	
	{
	"nom": "Lune",
	"position": Vector3(
		1.467504356289682e11,
	   -3.348358272420974e10,
		1.621001502867788e6
	),
	"vitesse": Vector3(
		5.111148009785804e3,
		2.927930184189317e4,
		8.144554070192456e1
	)
},

	# ======================
	# LUNES DE MARS
	# ======================

	{
	"nom": "Phobos",
	"position": Vector3(
		1.478445618091074e11,
	   -1.462877090202883e11,
	   -6.677401082616106e9
	),
	"vitesse": Vector3(
		1.797534978187581e4,
		2.152601694593629e4,
		9.214767627820031e1
	)
},

	{
	"nom": "Déimos",
	"position": Vector3(
		1.478565346131245e11,
	   -1.462922495741027e11,
	   -6.684241340081371e9
	),
	"vitesse": Vector3(
		1.817615308982912e4,
		2.068702608965749e4,
	   -8.763410098854596e1
	)
},

	# ======================
	# LUNES DE JUPITER
	# ======================

	{
	"nom": "Io",
	"position": Vector3(
	   -1.367203251665076e10,
		7.666746830536211e11,
	   -2.852090035841882e9
	),
	"vitesse": Vector3(
	   -2.263806041457634e4,
		1.494887087781140e4,
		6.683125004022070e2
	)
},

	{
	"nom": "Europe",
	"position": Vector3(
	   -1.468532788993735e10,
		7.665343104598749e11,
	   -2.870432267844856e9
	),
	"vitesse": Vector3(
	   -1.516250504184829e4,
	   -1.331431864102891e4,
	   -1.143175625135857e2
	)
},

	{
	"nom": "Ganymède",
	"position": Vector3(
	   -1.308766093645298e10,
		7.659315553089708e11,
	   -2.873557347316027e9
	),
	"vitesse": Vector3(
	   -7.980299727555004e3,
		9.925452508998138e3,
		7.094107050493337e2
	)
},

	{
	"nom": "Callisto",
	"position": Vector3(
	   -1.370352625743141e10,
		7.682975980706885e11,
	   -2.800712422295153e9
	),
	"vitesse": Vector3(
	   -2.130263498077029e4,
		1.848514137509657e3,
		2.338653805008385e2
	)
},

	# ======================
	# LUNES DE SATURNE
	# ======================
{
		"nom": "Titan",
		"position": Vector3(
			5.017917467058342e11,
			1.260996685644237e12,
			-4.230524154371518e10
		),
		"vitesse": Vector3(
			-1.317728001619841e4,
			7.470643050360275e3,
			-1.346128705245466e3
		)
	},

	{
		"nom": "Encelade",
		"position": Vector3(
			5.006738341534903e11,
			1.260276514565203e12,
			-4.182392267456269e10
		),
		"vitesse": Vector3(
			-7.177780958323636e3,
			-7.588171554814361e3,
			5.928224736327691e3
		)
	},

	{
		"nom": "Mimas",
		"position": Vector3(
			5.010614365110517e11,
			1.260392896375774e12,
			-4.192367048164630e10
		),
		"vitesse": Vector3(
			-1.745603881924340e4,
			1.430233358596351e4,
			-4.119981272515169e3
		)
	},

	{
		"nom": "Téthys",
		"position": Vector3(
			5.011984831099104e11,
			1.260270136087623e12,
			-4.186502659606260e10
		),
		"vitesse": Vector3(
			-8.310082081068867e3,
			1.350608662155839e4,
			-4.997711370084700e3
		)
	},

	{
		"nom": "Dioné",
		"position": Vector3(5.005344475871005e11, 1.260375492958668e12, -4.186212241741812e10),
		"vitesse":  Vector3(-1.112178572927122e4, -5.141568318117498e3, 5.020246440098569e3)
	},

	{
		"nom": "Rhéa",
		"position": Vector3(5.010709827671270e11, 1.260742227317861e12, -4.210796331108266e10),
		"vitesse":  Vector3(-1.750403970274332e4, 6.255623791143360e3, -2.783686985456812e2)
	},

	{
		"nom": "Japet",
		"position": Vector3(4.980524826999837e11, 1.262544939173432e12, -4.181523730697614e10),
		"vitesse":  Vector3(-1.141870900351200e4, 1.173187063970883e3, 1.264422773101535e3)
	},

	{
		"nom": "Miranda",
		"position": Vector3(2.389847677447981e12, -1.794824479038412e12, -3.776009175883830e10),
		"vitesse":  Vector3(-2.526139245720409e3, 6.216372512163788e3, 6.434175353796769e2)
	},

	{
		"nom": "Ariel",
		"position": Vector3(2.390038591369182e12, -1.794851531851569e12, -3.769520206007409e10),
		"vitesse":  Vector3(2.129792457430063e3, 4.832284852764186e3, -5.184564796924192e3)
	},

	{
		"nom": "Umbriel",
		"position": Vector3(2.389957275632482e12, -1.794858606047484e12, -3.787617225402498e10),
		"vitesse":  Vector3(-2.241062528564211e2, 5.818545432948116e3, -1.802423835110520e3)
	},

	{
		"nom": "Titania",
		"position": Vector3(2.389989753073999e12, -1.794889697479987e12, -3.804158260770631e10),
		"vitesse":  Vector3(6.350457907496843e2, 5.711117787347516e3, -1.205224589471795e3)
	},

	{
		"nom": "Obéron",
		"position": Vector3(2.389569767167663e12, -1.794812194579669e12, -3.813699744986379e10),
		"vitesse":  Vector3(1.397822495090637e3, 5.917705513037687e3, 1.490955434902455e3)
	},

	{
		"nom": "Triton",
		"position": Vector3(2.747300737118617e12, -3.567830621278091e12, 1.042701696055651e10),
		"vitesse":  Vector3(8.069089112591126e3, 5.445571395028919e3, -8.271258236976937e2)
	},

	{
		"nom": "Néréide",
		"position": Vector3(2.751567846590003e12, -3.560467619752304e12, 1.091401648211026e10),
		"vitesse":  Vector3(4.024889524552468e3, 3.867820431362029e3, -1.464909402684327e2)
	},

	{
		"nom": "Protée",
		"position": Vector3(2.747485976939874e12, -3.568023542997373e12, 1.012699894204664e10),
		"vitesse":  Vector3(3.325508598817522e3, 1.031093890069681e4, 2.787751279132464e3)
	}
	
]
const noms_lunes = [
	{"nom": "Lune"},

	# Mars
	{"nom": "Phobos"},
	{"nom": "Déimos"},

	# Jupiter
	{"nom": "Io"},
	{"nom": "Europe"},
	{"nom": "Ganymède"},
	{"nom": "Callisto"},

	# Saturne
	{"nom": "Titan"},
	{"nom": "Encelade"},
	{"nom": "Mimas"},
	{"nom": "Téthys"},
	{"nom": "Dioné"},
	{"nom": "Rhéa"},
	{"nom": "Japet"},

	# Uranus
	{"nom": "Miranda"},
	{"nom": "Ariel"},
	{"nom": "Umbriel"},
	{"nom": "Titania"},
	{"nom": "Obéron"},

	# Neptune
	{"nom": "Triton"},
	{"nom": "Néréide"},
	{"nom": "Protée"}
]
