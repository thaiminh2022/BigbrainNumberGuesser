extends CanvasLayer

@export var num_input:NumberInput;
@export var text_scroll_container: Container;

func _ready() -> void:
    num_input.number_submited.connect(number_submited)

func number_submited(correct_amount: int, submited_number: String) -> void:
    var display_label = Label.new()
    var display_text = "%s -> %s" % [correct_amount, submited_number];

    display_label.text = display_text;
    text_scroll_container.add_child(display_label)
