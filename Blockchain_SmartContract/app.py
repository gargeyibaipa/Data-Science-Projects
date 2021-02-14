import sys
import json
import os
import fisher
import validator
import worker
import fileinput
import approve
import fishentry
import fisherquery
import validator
import worker

os.system('cls')
print('-------------------------------------------------------------------')
print('-------------------------------------------------------------------')
print('Team - 2 Project - Fish Tracking')
print('-------------------------------------------------------------------')
print('-------------------------------------------------------------------')

print("1 - Fisher")
print("2 - Verifier")
print("3 - Distributor")
user_type = int(input("Please enter user type: "))

if user_type == 1:
    print("Entering the system as Fisher")
    fisher.fisher()
elif user_type == 2:
    print("Entering the system as verifier")
    validator.validator()
elif user_type == 3:
    print("Entering the system as distributur worker")
    worker.worker()
else:
    print("Error: Valid option needs to be choosen")
    exit