extends Button

@onready var moneylabel = get_node("/root/Main/money")
@onready var upgradebutton = get_node("../upgrade")

func _on_pressed() -> void:
	if Details.money >= (100 * Details.workerPriceMultiplier):
		Details.money -= (100 * Details.workerPriceMultiplier)
		moneylabel.text = "$" + str(Details.money)
		Details.studioDevSpeed += 2.5
		Details.workerPriceMultiplier += 0.5
		text = "$" + str(100 * Details.workerPriceMultiplier)

func _on_mouse_entered() -> void:
	text = "$" + str(100 * Details.workerPriceMultiplier)

func _on_mouse_exited() -> void:
	text = "Hire Workers"

func _on_upgrade_pressed() -> void:
	if Details.money >= (200 * Details.marketPriceMultiplier):
		Details.money -= (200 * Details.marketPriceMultiplier)
		Details.projIdleGain += 0.25
		Details.marketPriceMultiplier += 0.5
		upgradebutton.text = "$" + str(200 * Details.marketPriceMultiplier)

func _on_upgrade_mouse_entered() -> void:
	upgradebutton.text = "$" + str(200 * Details.marketPriceMultiplier)

func _on_upgrade_mouse_exited() -> void:
	upgradebutton.text = "Hire Marketing"
