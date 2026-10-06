extends CardState


var played: bool

func enter() -> void:
	if not card.is_node_ready():
		await card.ready
	card.background.color = Color.DARK_VIOLET
	card.state_label.text = "Released"
	
	played = false
	if not card.targets.is_empty():
		played = true
		print("Play card for targets: ", card.targets)
	else: 
		await get_tree().process_frame
		transition_requested.emit(self, State.BASE)


#func input(_event: InputEvent) -> void:
	#if played:
		#return
	#transition_requested.emit(self, State.BASE)
