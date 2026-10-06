extends CardState


func enter() -> void:
	if not card.is_node_ready():
		await card.ready
	
	card.reparent_requested.emit(card)
	card.background.color = Color.GREEN
	card.state_label.text = "Base"
	card.pivot_offset = Vector2.ZERO


func gui_input(event: InputEvent) -> void:
	if event is InputEventScreenTouch and event.is_pressed():
		card.pivot_offset = event.position
		transition_requested.emit(self, State.CLICKED)
