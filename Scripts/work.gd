extends Button

@onready var label = get_node("../../projectsmenu/projects")
@onready var clicksound = get_node("/root/Main/click")

func _on_pressed() -> void:
	clicksound.play()
	if Details.projCurrent == true:
			Details.projProgress += (5 / Details.projComplexity)
