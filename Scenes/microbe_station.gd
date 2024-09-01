extends Node3D
class_name MicrobeStation

@onready var petri_grid: ClickableGrid = $PetriGrid

@export var grid_dimensions: Vector2i = Vector2i(4, 4)
@export var table_height: float = 0.85344

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	petri_grid.clear()
	petri_grid.position.y = table_height

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	var grid_mouse_position: Vector3 = petri_grid.mouse_to_grid()
	print(grid_mouse_position)
	petri_grid.clear()
	petri_grid.set_cell_item(grid_mouse_position, 0)
