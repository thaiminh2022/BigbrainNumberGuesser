extends Control

@export var number_guess_amount: Label
@export var position_guess_amount: Label
@export var total_guess_amount: Label

@export var stats_display: Button;
@export var open_stat_btn: Button

func _ready() -> void:
    hide();
    GameManager.instance.finalize_state.on_game_eneded.connect(on_game_ended)
    open_stat_btn.pressed.connect(open_stat)
    stats_display.pressed.connect(hide_stat);

func on_game_ended():
    show();
    var game_data := GameManager.instance.game_data;

    number_guess_amount.text = str(game_data.number_guess_count);
    position_guess_amount.text = str(game_data.position_guess_count)
    total_guess_amount.text = str(game_data.get_total_guess())

func open_stat():
    stats_display.show();

func hide_stat() -> void:
    stats_display.hide();
