class_name NumberInput extends HBoxContainer

signal number_submited;

@export var num_line_edit: LineEdit;
@export var submit_btn: Button;

func _ready() -> void:
    submit_btn.pressed.connect(send_number_to_guess);
    num_line_edit.text_submitted.connect(send_number_to_guess);

func send_number_to_guess() -> void:
    var text := num_line_edit.text;

    if text.length() != GameManager.instance.get_number_len():
        return;

    if !text.is_valid_int():
        return;
    
    if text[0] == "0":
        return;

    var correct_count:int = GameManager.instance.guess_number(int(text))
    number_submited.emit(correct_count, text)
