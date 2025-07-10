extends Button

@onready var makemenu = get_node("../makemenu")
@onready var sound = get_node("/root/Main/click")
var clicksound = preload("res://Assets/click.mp3")

func _on_pressed() -> void:
	sound.play()
	if makemenu.visible == true:
		makemenu.visible = false
		text = "Create"
	else:
		makemenu.visible = true
		text = "Cancel"
