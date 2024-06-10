class_name GameManager extends Node 

# This script holds the inner logic of the game

@export var new_game_state:NewGameState;
@export var number_guessing_state:NumberGuessingState;
@export var position_guessing_state:GameManagerPositionGuessingState;
@export var finalize_state:FinalizeState;

var game_settings: GameSettings = GameSettings.new();
var game_data: GameData = GameData.new();

var current_state: GameManagerDefaultState;

func switch_state(new_state: GameManagerDefaultState) -> void:
    if new_state != null:
        current_state = new_state;
        current_state._start();

func _process(delta: float) -> void:
    if current_state != null:
        current_state._update(delta)

class GameSettings:
    var number_length: int = 3;

class GameData:
    var number_list: Array[int] = []
    
    func reset() -> void:
        number_list = []

