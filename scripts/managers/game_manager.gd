class_name GameManager extends Node 

# This script holds the inner logic of the game

static var instance: GameManager;

@export var num_input: LineEdit;

var number_items:Array[String] = []
func _enter_tree() -> void:
    instance = self;

func _ready() -> void:
    number_items = ["1", "3", "9"]
    num_input.text_submitted.connect(func(t): print(guess_number(int(t))));


func new_game(n_len: int) -> void:
    _new_random_number(n_len);
    
func _new_random_number(num_len: int) -> void:
    var start = 10 ** num_len;
    var end = 10 **(num_len +1) -1; 

    for c in str(randi_range(start, end)):
        number_items.append(c);

func get_number_len() -> int:
    return len(number_items)

func guess_number(num: int) -> int:

    return find_correct_amount(num)

func find_correct_amount(num:int) -> int:
    if str(num).length() != len(number_items):
        return -1;

    var correct_pos_count:int = 0
    for n in str(num):
        if n in number_items:
            correct_pos_count += 1;
    
    return correct_pos_count;


