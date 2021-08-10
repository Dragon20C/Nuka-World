extends Node

var health_system
var action_system
var current_hp = 120
var max_hp = 120
var current_ap = 100
var max_ap = 100

signal update_hp(_value,change)
signal update_ap()

func _ready():
	health_system.set_settings(current_hp,max_hp)
	action_system.set_settings(current_ap,max_ap)
