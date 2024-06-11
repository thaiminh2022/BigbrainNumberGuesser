extends HBoxContainer

@export var num_line_edit: LineEdit;
@export var submit_btn: Button;
@export var error_displayer: ErrorDisplay;

func _ready() -> void:
    GameManager.instance \
    .new_game_state.on_finish_new_game_setup.connect(_setup_max_len)
    
    submit_btn.pressed.connect(_submit_number);
    num_line_edit.text_submitted.connect(func(_t): _submit_number())

func _setup_max_len() -> void:
    num_line_edit.max_length = GameManager.instance.game_settings.number_length

func _submit_number() -> void:
    var text := num_line_edit.text.strip_edges();
    
    if text == "/ff":
        GameManager.instance.surrender();
        return

    var is_valid := _is_valid_text(text);
    var number = int(text)
    
    if is_valid:
        GameManager.instance.guess_number(number)

func _is_valid_text(text: String) -> bool:
    var num_len := GameManager.instance.game_settings.number_length;
    if text.length() != num_len:
        error_displayer.display_error("Length not correct");
        return false;
    
    if !text.is_valid_int():
        error_displayer.display_error("Not number");
        return false;

    # Triple checking if there are any duplicated number
    for c in text:
        var c_count = text.count(c);
        if c_count != 1:
            error_displayer.display_error("No duplicated number");
            return false;
    
    return true;
