import sys
import json
import os
import fisherquery
import re
import approve
import fileinput

def validator():
    os.system('cls')
    print('-------------------------------------------------------------------')
    print('-------------------------------------------------------------------')
    print('Team - 2 Project - Fish Tracking')
    print('-------------------------------------------------------------------')
    print('-------------------------------------------------------------------')

    print("1 - validate a transaction")
    print("2 - Query for already existing details")
    print("3 - For all the data")
    user_action = int(input("Please enter action you want to do: "))

    if user_action == 1:
        approve.approve()
    elif user_action == 2:
        fisherquery.fishquery()
    elif user_action == 3:
        filename = 'fish.txt'
        fishersearch = open('./transactions/' + filename, "r")
        for line in fishersearch:
            print(line + '\n')
            print('-----------------------------------------')
    else:
        print("Error: Valid option needs to be choosen")
        exit


if __name__ == '__main__':
    validator
