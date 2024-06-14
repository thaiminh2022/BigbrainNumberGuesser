extends VBoxContainer

@export var line_edit: LineEdit;
@export var btns: Array[ActionButton];

func _ready() -> void:
    for btn in btns:
        btn.pressed.connect(func(): line_edit.text=btn.command);
