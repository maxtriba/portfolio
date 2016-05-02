#! /usr/bin/env python

# Prelaunchr Coupon Test Script
# Create example email addresses, right tailed distribution of referral numbers
# Create random strings of coupon codes (numbers and letters), 1 for each email and whose value depends on referral count 

import string
import random
import stripe

stripe.api_key = "API_KEI"
e = 10
eandc = {}

# Random Code Generator

def code_gen(size = 6, chars=string.ascii_uppercase + string.digits):
	return ''.join(random.choice(chars) for _ in range(size))

# Create example emails and referral counts

for i in range(0,e):
	email = "Customer" + str(i) + "@email.com"
	
	code = code_gen()
	
	if i < (.66*e):
		c = code + "A5"
	elif (.67*e) < i < (.88*e): 
		c = code + "B10"
	elif (.88*e) < i < (e):
		c = code + "C20"
		
	eandc[email] = c

for i, j in eandc.items():
	print "Email: " + i + ", Code:" + j
	

	
	
	
	
	
  

  
  
  
  
  
  
  
  
  
  
  
  
  