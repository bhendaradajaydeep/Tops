import numpy as np
my_list = list(range(1, 1001))
my_array = np.array(range(1, 1001))
print("List:", my_list[:5], "...", my_list[-5:])
print("NumPy Array:", my_array[:5], "...", my_array[-5:])