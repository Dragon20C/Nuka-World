extends TextureProgress

onready var tween = get_node("Tween")
var current_hp
var max_hp
var Text_Input : int
var duration : float = 0.1
# new_hp_value(90,"-") # first value damage / regen, 2nd value is adding or taking away

func _init():
	PlayerStats.health_system = self

func set_settings(_current_hp,_max_hp):
	max_value = _max_hp
	value = _current_hp
	current_hp = _current_hp
	max_hp = _max_hp
	
func update_hp(_value : float,change : String): # Value How much damage or health, change + or -
	var new_health = current_hp
	if change == "-":
		new_health -= _value
	elif change == "+":
		new_health += _value
	new_health = clamp(new_health,0,max_hp)
	tween.interpolate_property(self,"value",current_hp,new_health,duration,Tween.EASE_OUT) # Smooth transition
	tween.interpolate_property(self,"current_hp",current_hp,new_health,duration)
	tween.start()

func stimpak():
	var hp_points = 30
	while hp_points != 0:
		tween.interpolate_property(self,"value",current_hp,current_hp + 1,duration,Tween.EASE_OUT)
		tween.start()
		current_hp += 1
		hp_points -= 1
		current_hp = clamp(current_hp,0,max_hp)
		yield(get_tree().create_timer(0.2), "timeout")

func _on_LineEdit_text_entered(new_text):
	if new_text.is_valid_integer():
		Text_Input = int(new_text)


func _on_Damage_pressed():
	update_hp(Text_Input,"-")


func _on_Heal_pressed():
	update_hp(Text_Input,"+")


func _on_Stimpack_pressed():
	stimpak()
