extends Button

@onready var label = get_node("../../projectsmenu/projects")
@onready var sound = get_node("/root/Main/click")

func _on_pressed() -> void:
	sound.play()
	if Details.projCurrent == true:
			Details.projProgress += (5 / Details.projComplexity)
