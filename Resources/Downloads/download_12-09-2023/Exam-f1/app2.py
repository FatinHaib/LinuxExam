import sys

# total arguments
n = len(sys.argv)

for i in range(1, n):
	print(sys.argv[i], end = " ")
	
# Addition of numbers
Sum = 0
# Using argparse module
for i in range(1, n):
	Sum += int(sys.argv[i])
	
print("sum-->",Sum)