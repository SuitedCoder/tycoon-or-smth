extends Button

@onready var clicksound = get_node("/root/Main/click")
@onready var tip = get_node("/root/Main/tip")
@onready var tiplabel = get_node("/root/Main/tip/Label")
@onready var tipbutton = get_node("/root/Main/tip/Button2")

func _process(delta: float) -> void:
	if Details.money >= 100000 and Details.rebirths == 0:
		disabled = false
		text = "Expand studio"
	else:
		disabled = true
		text = ""

func _on_button_down() -> void:
	clicksound.play()
	if Details.money >= 100000:
		Details.money -= 25000
		Details.rebirths += 1
		disabled = true
		text = ""
		tip.visible = true
		tiplabel.text = "Message: \nHaving been successful with your games, you successfully entered the niche game dev community."
		tiplabel.notify_property_list_changed()
		tipbutton.text = "Let's get to work"
