extends Control

@export var text_edit: TextEdit;

func _ready() -> void:
    GameManager.instance.finalize_state.on_game_eneded.connect(game_end);

func game_end():
    text_edit.clear();
