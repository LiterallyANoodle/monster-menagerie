extends Node3D
class_name MicrobeStation

@onready var petri_grid: GridMap = $PetriGrid

@export var grid_dimensions: Vector2i = Vector2i(4, 4)
@export var table_height: float = 0.85344

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	petri_grid.clear()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	var grid_mouse_position: Vector3 = mouse_to_grid(petri_grid, table_height)
	print(grid_mouse_position)
	petri_grid.clear()
	petri_grid.set_cell_item(grid_mouse_position, 0)

# grid highlighting 
func mouse_to_grid(grid: GridMap, table_height: float) -> Vector3:
	
	var viewport: Viewport = get_viewport()
	var mouse_position: Vector2 = viewport.get_mouse_position()
	var camera: Camera3D = viewport.get_camera_3d()
	var origin: Vector3 = camera.project_ray_origin(mouse_position)
	var direction: Vector3 = camera.project_ray_normal(mouse_position)
	var ray_length: float = camera.far
	var end: Vector3 = origin + direction * ray_length
	# orthogonal plane intersection is simple
	var d: float = ((Vector3(0, table_height, 0) - origin).dot(Vector3.UP)) / (direction.dot(Vector3.UP))
	var global_mouse_position_3d: Vector3 = origin + (d * direction)
	return grid.local_to_map(grid.to_local(global_mouse_position_3d + (grid.cell_size / 2)))
