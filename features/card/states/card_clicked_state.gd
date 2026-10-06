extends CardState


func enter() -> void:
	if not card.is_node_ready():
		await card.ready
	
	card.background.color = Color.ORANGE
	card.state_label.text = "Clicked"
	card.drop_detector.monitoring = true


func input(event: InputEvent) -> void:
	if event is InputEventScreenDrag:
		transition_requested.emit(self, State.DRAGGING)
