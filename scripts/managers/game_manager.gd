class_name GameManager extends Node

@export var new_game_state: NewGameState;
@export var number_guessing_state:NumberGuessingState;
@export var position_guessing_state:PositionGuessingState;
@export var finalize_state:FinalizeState;

var game_settings: GameSettings = GameSettings.new();
var game_data: GameData = GameData.new();
var current_state: GameManagerDefaultState;

static var instance: GameManager;

func _enter_tree() -> void:
    instance =  self

func new_game(number_length: int) -> void:
    game_settings.number_length = number_length
    switch_state(new_game_state);

func guess_number(number:int):
    print("Fix")
    if current_state == number_guessing_state:
        number_guessing_state.guess(number)

    elif current_state == position_guessing_state :
        position_guessing_state.guess(number)

func switch_state(new_state: GameManagerDefaultState) -> void:
    if new_state != null:
        current_state = new_state;
        current_state._start();

func _process(delta: float) -> void:
    if current_state != null:
        current_state._update(delta)



class GameSettings:
    var number_length: int = -1;

class GameData:
    var number_list: Array[int] = []
    
    func reset() -> void:
        number_list = []

