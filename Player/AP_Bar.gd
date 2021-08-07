extends TextureProgress


onready var tween = get_node("Tween")
var current_ap = 100
var max_ap = 100
var active : bool = false

func _ready():
	value = current_ap
	max_value = max_ap

		
func decrease_ap(_value):
	active = true
	tween.stop(self,"value")
	var new_ap_value = current_ap
	new_ap_value -= _value
	new_ap_value = clamp(new_ap_value,0,max_ap)
	tween.interpolate_property(self,"value",current_ap,new_ap_value,0.8)
	tween.start()
	current_ap = new_ap_value
	
func refil_ap():
	tween.interpolate_property(self,"value",current_ap,100,2)
	tween.start()
	print("refiling")

func _on_Tween_tween_completed(object, key):
	refil_ap()
