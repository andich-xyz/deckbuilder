class_name CardStateMachine
extends Node


@export var initial_state: CardState
var current_state: CardState
var states: Dictionary[CardState.State, CardState] = {}


func init(card: Card) -> void:
	for child: Node in get_children():
		if child is not CardState:
			return
		var card_state: CardState = child as CardState
		states[card_state.state] = card_state
		card_state.transition_requested.connect(_on_transition_requested)
		card_state.card = card
		
		if initial_state:
			current_state = initial_state
			current_state.enter()


func on_input(event: InputEvent) -> void: 
	if current_state:
		current_state.input(event)


func on_gui_input(event: InputEvent) -> void: 
	if current_state:
		current_state.gui_input(event)


func on_mouse_entered() -> void:
	if current_state:
		current_state.on_mouse_entered()


func on_mouse_exited() -> void:
	if current_state:
		current_state.on_mouse_exited()


func _on_transition_requested(from: CardState, to: CardState.State) -> void: 
	if not from == current_state:
		return
	var new_state: CardState = states[to]
	if not new_state:
		return
	if current_state:
		current_state.exit()
	new_state.enter()
	current_state = new_state
