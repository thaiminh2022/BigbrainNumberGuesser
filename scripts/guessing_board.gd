class_name GuessingBoard extends Node

static var instance: GuessingBoard;

@export var msg_display: Label;

var _msg_list: Array[String] = []

func _enter_tree() -> void:
    instance = self;
func reset_static() -> void:
    instance = null;

func _ready() -> void:
    GameManager.instance \
    .number_guessing_state.on_guess_number \
    .connect(func(correct_amount, guess_number):
        _on_guess(correct_amount, guess_number, true))
        
    GameManager.instance \
    .position_guessing_state.on_guess_position \
    .connect(func(correct_amount, guess_number):
        _on_guess(correct_amount, guess_number, false))

func _on_guess(correct_amount: int, guess_number: int, is_number_guessing: bool) -> void:
    var msg = "%s -> %s" % [correct_amount, guess_number];
    
    if is_number_guessing:
        msg = "N" + msg;
    else:
        msg = "P" + msg;
        
    display_msg(msg)

func clear_msg():
    msg_display.text = "";

func recall_msg():
    var big_msg := "\n".join(_msg_list);
    display_msg(big_msg);

func display_msg(msg: String):
    
    msg_display.text += msg + "\n";
    _msg_list.append(msg)