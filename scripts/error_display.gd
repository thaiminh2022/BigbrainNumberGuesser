class_name ErrorDisplay extends Label

@export var display_timer: Timer;

func _ready() -> void:
    text = "";
    display_timer.timeout.connect(func(): text = "");
func display_error(msg: String):
    text = msg;
    display_timer.start();

