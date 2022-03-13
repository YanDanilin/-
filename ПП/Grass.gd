extends TileMap



func _ready():
	clear()
	randomize()
	gen()
	pass # 

func gen():
	var matrix = []
	for i in range(50):
		matrix.append([])
		matrix[i] = []
		for j in range(50):
			matrix[i].append([])
			matrix[i][j] = 1 + randi()%5
			if matrix[i][j] == 1:
				set_cell(i-25, j-25, 0)
			if matrix[i][j] == 2:
				set_cell(i-25, j-25, 2)
			if matrix[i][j] == 3:
				set_cell(i-25, j-25, 3)
			if matrix[i][j] == 4:
				set_cell(i-25, j-25, 4)
			if matrix[i][j] == 5:
				set_cell(i-25, j-25, 5)
			if matrix[i][j] == 6:
				set_cell(i-25, j-25, 9)
