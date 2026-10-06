class_name Hand
extends HBoxContainer


signal drag_started
signal state_changed(card: Card, state: CardState.State)
func _ready() -> void:
	for child: Node in get_children():
		if child is not Card:
			continue
		var card: Card = child
		card.reparent_requested.connect(_on_card_reparent_requested)


func _on_card_reparent_requested(card: Card) -> void: 
	card.reparent(self)
