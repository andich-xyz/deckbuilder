class_name Card
extends Control


signal reparent_requested(card: Card)
@onready var background: ColorRect = %Background
@onready var state_label: Label = %StateLabel
@onready var card_state_machine = %CardStateMachine
@onready var drop_detector: Area2D = %DropDetector
var targets: Array[Area2D]


func _ready() -> void:
	card_state_machine.init(self)
	mouse_entered.connect(_on_mouse_entered)
	mouse_exited.connect(_on_mouse_exited)
	drop_detector.area_entered.connect(_on_area_entered)
	drop_detector.area_exited.connect(_on_area_exited)


func _input(event: InputEvent) -> void:
	card_state_machine.on_input(event)


func _gui_input(event: InputEvent) -> void:
	card_state_machine.on_gui_input(event)


func _on_mouse_entered() -> void: 
	card_state_machine.on_mouse_entered()


func _on_mouse_exited() -> void: 
	card_state_machine.on_mouse_exited()


func _on_area_entered(area: Area2D) -> void:
	if not targets.has(area):
		targets.append(area)


func _on_area_exited(area: Area2D) -> void: 
	targets.erase(area)
