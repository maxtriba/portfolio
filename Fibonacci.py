#! /usr/bin/env python

#Solution to Project Euler question: "Print sum of all even fibonacci numbers less than 4,000,000"


n = 0
array = []

def fib(n):
	if n > 1:
		return fib(n-1) + fib(n-2)
	return n
	
while fib(n) < 4000000:
	n += 1
	array.append(fib(n))

print sum(j for j in array if j % 2 == 0 and j < 4000000)
print array

