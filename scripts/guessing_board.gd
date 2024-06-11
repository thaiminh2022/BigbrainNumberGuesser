extends Node

@export var display_parent: Control;

func _ready() -> void:
    GameManager.instance \
    .number_guessing_state.on_guess_number \
    .connect(func(correct_amount, guess_number): 
        on_guess(correct_amount, guess_number, true))
        
    GameManager.instance \
    .position_guessing_state.on_guess_position \
    .connect(func(correct_amount, guess_number): 
        on_guess(correct_amount, guess_number, false))

func on_guess(correct_amount: int, guess_number: int, is_number_guessing: bool) -> void:
    var msg = "%s -> %s" % [correct_amount, guess_number];
    
    if is_number_guessing:
        msg = "N" + msg;
    else:
        msg = "P" + msg;
        
    display_on_guess_box(msg)

func display_on_guess_box(msg: String):
    var label := Label.new();
    label.text = msg;
    
    display_parent.add_child(label)
    
