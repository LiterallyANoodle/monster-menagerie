extends Node3D
class_name MicrobeStation

@onready var petri_grid: ClickableGrid = $PetriGrid

@export var grid_dimensions: Vector2i = Vector2i(3, 4)
@export var table_height: float = 0.85344

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	petri_grid.clear()
	petri_grid.position.y = table_height

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	# Raycast to grid. Get hovered grid spot.
	var grid_mouse_position: Vector3i = petri_grid.mouse_to_grid()
	#petri_grid.clear()
	var hovered_grid_selection: Vector3i = Vector3i(-1, -1, -1)
	if (range(grid_dimensions.x).has(-grid_mouse_position.x)
		and range(grid_dimensions.y).has(grid_mouse_position.z)):
		#petri_grid.set_cell_item(grid_mouse_position, 0)
		hovered_grid_selection = grid_mouse_position
	
	# handle input 
	# left clicking 
	if (Input.is_action_just_pressed("Interact")):
		# placing/removing petri dishes
		if (hovered_grid_selection != Vector3i(-1, -1, -1)):
			petri_grid.set_cell_item(hovered_grid_selection, 0)
