extends Node

# [[1, 2, 3], [1, 2, 3, 4, 5, 6]]
# 1   1 4
# 2   2 5
# 3   3 6

var weights: Array = [[1, 2, 3], [1, 2, 3, 4, 5, 6]]

func predict(data):
	for weight_layer in weights:
		var next_layer_length = int(weight_layer.size() / data.size())
		var next_data = []
		for i in range(next_layer_length):
			next_data.append(0)
			for j in range(len(data)):
				next_data[-1] += data[j] * weight_layer[i * len(data) + j]
		data = next_data
	return data
