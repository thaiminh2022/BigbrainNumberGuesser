class_name GameManagerDefaultState extends Node

@export var game_manager: GameManager

func _start():
    pass;

func _update(_delta:float):
    pass


func is_current_self() -> bool:
    return game_manager.current_state == self;
