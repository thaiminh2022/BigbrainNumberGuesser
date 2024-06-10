class_name GameManagerPositionGuessingState extends GameManagerDefaultState

static var instance:GameManagerPositionGuessingState;


func guess(number:int):
    pass

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

    
