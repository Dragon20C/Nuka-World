extends TextureProgress

onready var tween = get_node("Tween")
var current_hp = 0
var max_hp = 0
var duration : float = 0.0

# new_hp_value(90,"-") # first value damage / regen, 2nd value is adding or taking away

func _ready():
	set_hp_settings(100,100)

func _physics_process(delta):
	if Input.is_action_just_pressed("E"):
		update_hp(12,"-")
	if Input.is_action_just_pressed("jump"):
		tween.stop(self)

func set_hp_settings(_current_hp,_max_hp):
	value = _current_hp
	max_value = _max_hp
	current_hp = _current_hp
	max_hp = _max_hp
	
func update_hp(_value : float,change : String): # Value How much damage or health, change + or -
	var new_health = current_hp
	if change == "-":
		new_health -= _value
	elif change == "+":
		new_health += _value
	new_health = clamp(new_health,0,max_hp)
	duration = 0.1
	tween.interpolate_property(self,"value",current_hp,new_health,duration) # Smooth transition
	tween.interpolate_property(self,"current_hp",current_hp,new_health,duration)
	tween.start()
