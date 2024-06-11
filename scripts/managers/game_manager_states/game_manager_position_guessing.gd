class_name PositionGuessingState extends GameManagerDefaultState

static var instance:PositionGuessingState;

signal on_guess_position;

func guess(number:int):
    if !is_current_self():
        return;

    var correct_amount = _guess_position(number)
    
    on_guess_position.emit(correct_amount, number)
    
    if correct_amount == game_manager.instance.game_settings.number_length:
        game_manager.switch_state(game_manager.finalize_state)


func _guess_position(number: int) -> int:
    var number_list:= game_manager.game_data.number_list;
    var num_str = str(number)
    var correct_count =0;

    for i in range(0, len(number_list)):
        var n1 = number_list[i]
        var n2 = int(num_str[i])

        if n1 == n2:
            correct_count+=1;



    return correct_count


