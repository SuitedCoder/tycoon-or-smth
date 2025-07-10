extends Button

@onready var tip = get_node("..")
@onready var tiplabel = get_node("../Label")
@onready var clicksound = get_node("/root/Main/click")
var streak = 0

func _on_pressed() -> void:
	if streak == 0:
		clicksound.play()
		if tip.visible == false:
			tip.visible = true
		else:
			tip.visible = false
	else:
		streak -= 1
		text = "what"
		tiplabel.text = "there is nothing past this point at this stage of development"

func _on_change() -> void:
	streak += 1
