import os
import json
import sys
import random
from datetime import date
import time
import re


def fishquery():
    os.system('cls')
    filename = 'fish.txt'
    print('-------------------------------------------------------------------')
    print('-------------------------------------------------------------------')
    print('Team - 2 Project - Fish Tracking')
    print('-------------------------------------------------------------------')
    print('-------------------------------------------------------------------')
    user_search_string = input("Please enter Last Name of the fisher: ")
    fishersearch = open('./transactions/' + filename, "r")
    for line in fishersearch:
        if re.search(user_search_string, line):
            count = 1
            print(line + '\n')
            print('-----------------------------------------')
        else:
            count = 0
    if count == 0:
        print("No Matches found")


if __name__ == '__main__':
    fishquery
