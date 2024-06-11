class_name FinalizeState extends GameManagerDefaultState

signal on_game_eneded

func _start() -> void:
    print("Game Ended");
    on_game_eneded.emit();
