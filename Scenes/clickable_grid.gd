extends GridMap
class_name ClickableGrid

func mouse_to_grid(axis: Vector3 = Vector3.UP) -> Vector3i:
	
	var viewport: Viewport = get_viewport()
	var mouse_position: Vector2 = viewport.get_mouse_position()
	var camera: Camera3D = viewport.get_camera_3d()
	var origin: Vector3 = camera.project_ray_origin(mouse_position)
	var direction: Vector3 = camera.project_ray_normal(mouse_position)
	var ray_length: float = camera.far
	var end: Vector3 = origin + direction * ray_length
	# orthogonal plane intersection is simple
	var d: float = ((Vector3(0, self.position.y, 0) - origin).dot(axis)) / (direction.dot(axis))
	var global_mouse_position_3d: Vector3 = origin + (d * direction)
	return self.local_to_map(self.to_local(global_mouse_position_3d + (self.cell_size / 2)))
