extends TextureProgress


onready var tween = get_node("Tween")
var current_ap
var max_ap

func _init():
	PlayerStats.action_system = self

func set_settings(_current_ap,_max_ap):
	max_value = _max_ap
	value = _current_ap
	current_ap = _current_ap
	max_ap = _max_ap
	
func decrease_ap(delta):
	tween.stop(self)
	tween.interpolate_property(self,"value",current_ap,current_ap - 1,0.1)
	tween.start()
	current_ap -= 10 * delta
	current_ap = clamp(current_ap,0,max_ap)
	
func refil_ap(delta):
		tween.interpolate_property(self,"value",current_ap,current_ap + 1,0.1)
		tween.start()
		current_ap += 20 * delta
		current_ap = clamp(current_ap,0,max_ap)
