class_name NumberGuessingState extends GameManagerDefaultState

static var instance: NumberGuessingState;

signal on_guess_number;

func _enter_tree() -> void:
    instance = self;

func guess(number:int):
    if !is_current_self():
        return;

    var correct_amount := _guess_correct_count(number)
    if correct_amount == len(game_manager.game_data.number_list):
        game_manager.switch_state(game_manager.position_guessing_state);
    
    on_guess_number.emit(correct_amount)

    if correct_amount == game_manager.game_settings.number_length:
        game_manager.switch_state(game_manager.instance.position_guessing_state)



func _guess_correct_count(number: int) -> int:
    var num_str := str(number)
    var count := 0;
    
    for  c in num_str:
        if int(c) in game_manager.game_data.number_list:
            count+=1;
    
    return count

