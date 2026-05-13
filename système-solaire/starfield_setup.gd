extends WorldEnvironment
 
@export var shader_path : String = "res://deep_space_sky.gdshader"
 
## ── Exposed parameters ───────────────────────────────────────────
@export_group("Motion")
@export var time_scale       : float   = 1.0
@export var rotation_speed   : float   = 0.02
 
@export_group("Stars")
@export_range(0.0, 1.0)  var star_density    : float = 0.70
@export_range(0.0, 4.0)  var star_brightness : float = 1.6
@export_range(0.0, 5.0)  var twinkle_speed   : float = 1.2
@export_range(0.0, 1.0)  var twinkle_amount  : float = 0.50
 
@export_group("Nebula")
@export var show_nebula      : bool    = true
@export var nebula_tint_a    : Color   = Color(0.20, 0.04, 0.40)
@export var nebula_tint_b    : Color   = Color(0.04, 0.10, 0.35)
@export var nebula_tint_c    : Color   = Color(0.35, 0.05, 0.12)
@export_range(0.0, 2.0) var nebula_density : float = 0.80
 
@export_group("Milky Way")
@export var show_milky_way   : bool    = true
@export var milky_way_color  : Color   = Color(0.30, 0.32, 0.60)
@export_range(0.0, 2.0) var milky_way_density : float = 1.0
 
@export_group("Meteors")
@export var show_meteors     : bool    = true
@export_range(0.0, 6.0) var meteor_count : float = 3.0
@export_range(0.1, 5.0) var meteor_speed : float = 1.5
 
@export_group("Rendering")
@export_range(0.1, 4.0) var exposure : float = 1.0
 
var _mat : ShaderMaterial
 
func _ready() -> void:
	_setup_environment()
	_push_params()
 
func _setup_environment() -> void:
	var shader := load(shader_path) as Shader
	assert(shader != null, "Could not load deep_space_sky.gdshader — check the path.")
 
	_mat = ShaderMaterial.new()
	_mat.shader = shader
 
	var sky := Sky.new()
	sky.sky_material = _mat
	sky.process_mode = Sky.PROCESS_MODE_REALTIME   # animated shader needs this
	sky.radiance_size = Sky.RADIANCE_SIZE_256       # keep reflections cheap
 
	var env : Environment = environment
	if env == null:
		env = Environment.new()
		environment = env
 
	env.background_mode           = Environment.BG_SKY
	env.sky                       = sky
	env.ambient_light_source      = Environment.AMBIENT_SOURCE_SKY
	env.reflected_light_source    = Environment.REFLECTION_SOURCE_SKY
	env.ambient_light_sky_contribution = 0.3        # subtle fill, not blown out
	env.tonemap_mode              = Environment.TONE_MAPPER_FILMIC
	env.glow_enabled              = true
	env.glow_intensity            = 0.4
	env.glow_bloom                = 0.05
 
func _push_params() -> void:
	if not _mat: return
	_mat.set_shader_parameter("time_scale",       time_scale)
	_mat.set_shader_parameter("rotation_speed",   rotation_speed)
	_mat.set_shader_parameter("star_density",     star_density)
	_mat.set_shader_parameter("star_brightness",  star_brightness)
	_mat.set_shader_parameter("twinkle_speed",    twinkle_speed)
	_mat.set_shader_parameter("twinkle_amount",   twinkle_amount)
	_mat.set_shader_parameter("show_nebula",      show_nebula)
	_mat.set_shader_parameter("nebula_tint_a",    Vector3(nebula_tint_a.r, nebula_tint_a.g, nebula_tint_a.b))
	_mat.set_shader_parameter("nebula_tint_b",    Vector3(nebula_tint_b.r, nebula_tint_b.g, nebula_tint_b.b))
	_mat.set_shader_parameter("nebula_tint_c",    Vector3(nebula_tint_c.r, nebula_tint_c.g, nebula_tint_c.b))
	_mat.set_shader_parameter("nebula_density",   nebula_density)
	_mat.set_shader_parameter("show_milky_way",   show_milky_way)
	_mat.set_shader_parameter("milky_way_color",  Vector3(milky_way_color.r, milky_way_color.g, milky_way_color.b))
	_mat.set_shader_parameter("milky_way_density",milky_way_density)
	_mat.set_shader_parameter("show_meteors",     show_meteors)
	_mat.set_shader_parameter("meteor_count",     meteor_count)
	_mat.set_shader_parameter("meteor_speed",     meteor_speed)
	_mat.set_shader_parameter("exposure",         exposure)
 
## ── Runtime API ──────────────────────────────────────────────────
 
## Change any shader parameter at runtime
func set_sky_param(param: StringName, value: Variant) -> void:
	if _mat: _mat.set_shader_parameter(param, value)
 
## Smooth transition to a new exposure (e.g. entering a bright area)
func fade_exposure(target: float, duration: float = 1.5) -> void:
	var tw := create_tween()
	tw.tween_method(func(v): set_sky_param("exposure", v), exposure, target, duration)
	exposure = target
 
## Hyperspace / warp effect — spike time_scale then settle
func hyperspace(duration: float = 0.8) -> void:
	var tw := create_tween()
	tw.tween_method(func(v): set_sky_param("time_scale", v), time_scale, 12.0, duration * 0.25)
	tw.tween_method(func(v): set_sky_param("time_scale", v), 12.0, time_scale, duration * 0.75)
 
## Day/night-style toggle — fade stars in/out
func set_star_visibility(visible: bool, duration: float = 2.0) -> void:
	var target := 1.6 if visible else 0.0
	var tw := create_tween()
	tw.tween_method(func(v): set_sky_param("star_brightness", v), star_brightness, target, duration)
	star_brightness = target
 
