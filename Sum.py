#! /usr/bin/env python

# Author: Max Triba
# Project Euler solution to question: "Find the sum of the multiples of 3 or 5 below 1000"

import math

n = int(1000)
a = int(3)
b = int(5)

aResults = []
bResults = []
cResults = []

for i in range(0, int(n/a)+1):
	aResults.append(a * i)
	
for j in range(0, int(n/b)):
	bResults.append(b * j)
	
cResults = aResults + list(set(bResults) - set(aResults)) #Remove duplicates

print cResults