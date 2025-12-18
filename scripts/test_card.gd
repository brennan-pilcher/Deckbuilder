extends Node

@export var card: Node2D;
@export var cardImage: Sprite2D;
var dragging = false;
var dragTravel = 0;

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	print("script is running")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	print("card pos: " + str(card.position));
	print("image pos: " + str(cardImage.position));
	pass
		
	
func _physics_process(delta: float) -> void:
	if dragging:
		dragTravel += delta * 0.04
		var previousPosition = card.position
		
		cardImage.position = previousPosition.lerp(get_viewport().get_mouse_position(), dragTravel)
		card.position = get_viewport().get_mouse_position()
	pass
	
func _input(event: InputEvent) -> void:
	if event.is_action_pressed("click"):
		dragging = true;
		dragTravel = 0;
		print("dragging: " + str(dragging));
		
	if event.is_action_released("click"):
		dragging = false;
		print("dragging: " + str(dragging));
		
