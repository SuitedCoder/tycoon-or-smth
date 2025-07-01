extends Node

@onready var label = get_node("/root/Main/projectsmenu/projects")
@onready var moneylabel = get_node("/root/Main/money")

var projCurrent = false
var projWorkedOn = null
var projProgress = 0
var studioDevSpeed = 0
var money = 0
var projComplexity = 0
var workerPriceMultiplier = 1
var projIdleGain = 0
var marketPriceMultiplier = 1
var completedProj = 0

var _time_accumulator: float = 0.0
var _money_accumulator: float = 0.0
func _process(delta: float) -> void:
	_money_accumulator += delta
	if _money_accumulator >= 0.5:
		money += (20 * projIdleGain * completedProj)
		moneylabel.text = "$" + str(money)
		_money_accumulator = 0.0
	
	#project progress logic
	if projCurrent == true:
		if not Details.projProgress >= 100:
			_time_accumulator += delta
			moneylabel.text = "$" + str(money)
			label.text = projWorkedOn + " (" + str(Details.projProgress) + "%)"
			if _time_accumulator >= 0.5:
				projProgress += studioDevSpeed / projComplexity
				_time_accumulator = 0.0
		else:
			Details.projCurrent = false 
			Details.projWorkedOn = null
			label.text = "No projects yet"
			Details.projProgress = 0
			money += (1000 * projComplexity)
			moneylabel.text = "$" + str(money)
			completedProj += 1
	else:
		_time_accumulator = 0.0
		Details.projCurrent = false 
		Details.projWorkedOn = null
		label.text = "No projects yet"
		Details.projProgress = 0
