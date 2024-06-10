class_name NewGameState extends GameManagerDefaultState

static var instance: NewGameState;

func _enter_tree() -> void:
    instance = self;

func start_new_game():
    game_manager.switch_state(game_manager.new_game_state)

func _start():
    var number_list = generate_number_list(game_manager.game_settings.number_length)
    game_manager.game_data.number_list = number_list

func generate_number_list(amount: int) -> Array[int]:
    var start = 10 ** amount;
    var end = 10 ** (amount+1) -1;

    var items: Array[int] = []

    for c in str(randi_range(start, end)):
        items.append(int(c));
    
    return items
