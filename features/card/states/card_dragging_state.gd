extends CardState


func enter() -> void:
	if not card.is_node_ready():
		await card.ready
	
	var ui_layer: CanvasLayer = get_tree().get_first_node_in_group(&"ui_layer")
	if not ui_layer:
		return
	else:
		card.reparent(ui_layer)
	card.background.color = Color.NAVY_BLUE
	card.state_label.text = "Dragging"


func input(event: InputEvent) -> void:
	if event is InputEventScreenDrag:
		var screen_drag_event: InputEventScreenDrag = event
		card.position += screen_drag_event.relative
	if event.is_action(&"ui_cancel"):
		transition_requested.emit(self, State.BASE)
	if event is InputEventScreenTouch:
		var screen_touch_event: InputEventScreenTouch = event
		if screen_touch_event.is_released():
			transition_requested.emit(self, State.RELEASED)
