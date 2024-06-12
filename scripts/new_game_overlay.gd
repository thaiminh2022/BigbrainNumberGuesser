extends Control

@export var number_line_edit: LineEditNumber
@export var submit_btn: Button

func _ready() -> void:
    show()
    submit_btn.pressed.connect(start_new_game)
    number_line_edit.text_submitted.connect(func(_t): start_new_game());
    
func start_new_game() -> void:
    var number_len := number_line_edit.get_value();
    if number_len <= 0:
        return ;

    GameManager.instance.new_game(number_len);
    
    hide();
    process_mode = Node.PROCESS_MODE_DISABLED
