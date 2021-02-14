import sys
import json
import os
import re
import fishentry
import fisherquery

def fisher():
    os.system('cls')
    print('-------------------------------------------------------------------')
    print('-------------------------------------------------------------------')
    print('Team - 2 Project - Fish Tracking')
    print('-------------------------------------------------------------------')
    print('-------------------------------------------------------------------')

    print("1 - Enter New Fish Details")
    print("2 - Query for already existing details")
    user_action = int(input("Please enter action you want to do: "))

    if user_action == 1:
        print("Entering the Fish Details")
        fishentry.fishentry()
    elif user_action == 2:
        print("Entering the fish Details for querying")
        fisherquery.fishquery()
    else:
        print("Error: Valid option needs to be choosen")
        exit

if __name__== '__main__':
    fisher