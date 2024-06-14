extends Control

@export var number_guess_amount: Label
@export var position_guess_amount: Label
@export var total_guess_amount: Label
@export var stats_display: Control;

@export var end_game_state_display: Label

@export var close_stat_btn: Button
@export var open_stat_btn: Button

func _ready() -> void:
    hide();
    GameManager.instance.finalize_state.on_game_eneded.connect(on_game_ended)
    open_stat_btn.pressed.connect(open_stat)
    close_stat_btn.pressed.connect(hide_stat);

func on_game_ended():
    show();
    var game_data := GameManager.instance.game_data;

    number_guess_amount.text = str(game_data.number_guess_count);
    position_guess_amount.text = str(game_data.position_guess_count)
    total_guess_amount.text = str(game_data.get_total_guess())

    var answer := "".join(game_data.number_list)
    if game_data.is_lost:
        end_game_state_display.text = "DEFEATED\nAnswer was: " + answer;
    else:
        end_game_state_display.text = "VICTORY\nAnswer was: "+ answer;

func open_stat():
    stats_display.show();
    close_stat_btn.show();

func hide_stat() -> void:
    stats_display.hide();
    close_stat_btn.hide();
