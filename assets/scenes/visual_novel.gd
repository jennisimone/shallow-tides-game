extends Node

var dialogue: DialogueResource = load("res://assets/dialogue/test.dialogue")

func _ready() -> void:
	DialogueManager.show_dialogue_balloon(dialogue, "start")