class_name NewGameState extends GameManagerDefaultState

signal on_finish_new_game_setup;
func _start():
    var number_list = generate_number_list(game_manager.game_settings.number_length)
    print(number_list)
    game_manager.game_data.number_list = number_list
    
    on_finish_new_game_setup.emit();
    game_manager.switch_state(game_manager.number_guessing_state)

func generate_number_list(amount: int) -> Array[int]:
    var available_numbers := [1, 2, 3, 4, 5, 6,7 ,8, 9, 0]
    var end_index = 9;
    
    var number_list : Array[int] = [];
    for i in range(amount):
        var selected_index = -1;
        if i == 0:
            # remove 0 from first position
           selected_index = randi_range(0, 8);
        else:
            selected_index = randi_range(0, end_index)
        
        number_list.append(available_numbers.pop_at(selected_index))
        end_index -= 1;
        
    return number_list;
        
        
    
