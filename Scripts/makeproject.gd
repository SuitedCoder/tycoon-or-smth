extends Button

@onready var menu = get_node("..")
@onready var projname = get_node("../LineEdit")
@onready var label = get_node("../../projectsmenu/projects")
@onready var clicksound = get_node("/root/Main/click")
@onready var moneysound = get_node("/root/Main/cash")
@onready var button1 = get_node("/root/Main/create")
@onready var option = get_node("../complexitybutton")

func _on_pressed() -> void:
	clicksound.play()
	if projname.text != "":
		if Details.projCurrent == false:
			Details.projCurrent = true 
			menu.visible = false
			button1.text = "Create"
			Details.projWorkedOn = projname.text
			if option.selected == 0:
				Details.projComplexity = 1
			elif option.selected == 1:
				Details.projComplexity = 2
			elif option.selected == 2:
				Details.projComplexity = 3
			label.text = projname.text + " (" + str(Details.projProgress) + "%)"
		else:
			projname.text = "You are already working on something!"
			await get_tree().create_timer(0.5).timeout
			projname.text = ""
	else:
		projname.text = "Insert name"
		await get_tree().create_timer(0.5).timeout
		projname.text = ""
