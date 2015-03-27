#! /usr/bin/env python

#Solution to Project Euler question: "Print sum of all even fibonacci numbers less than 4,000,000

def rec_fib(n):
	if n > 1:
		return rec_fib(n-1) + rec_fib(n-2)
	return n
		
	
n = 0

array = []

while rec_fib(n) < 4000000:
	n += 1
	array.append(rec_fib(n))

print sum(j for j in array if j % 2 == 0 and j <4000000)
print array

