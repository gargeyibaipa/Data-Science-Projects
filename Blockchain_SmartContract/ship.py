import os
import json
import sys
import random
from datetime import date
import time
import re
import fileinput


def ship():
    os.system('cls')
    filename = 'fish.txt'
    print('-------------------------------------------------------------------')
    print('-------------------------------------------------------------------')
    print('Team - 2 Project - Fish Tracking')
    print('-------------------------------------------------------------------')
    print('-------------------------------------------------------------------')
    approve_search_string = input("Please enter transaction id: ")
    approve_user_string = input("Please enter shipper user id: ")
    fish_shipped_to = input("Please enter customer where fish shipped: ")
    approversearch = open('./transactions/' + filename, "r")
    
    approvecount = 1
    for line in approversearch:
        if re.search(approve_search_string, line):
            approvecount = 1
            oldline = line
            newline = line + 'Fish Shipped: Yes' ', ' 'Fish shipped by: ' + approve_user_string + ', ' 'Fish shipped to: ' + fish_shipped_to + ', '
        else:
            approvecount = 0

    if approvecount == 0:
        print("No Matches found")
    approversearch.close()

    with open('./transactions/' + filename, "r") as f:
        lines = f.readlines()
        f.close
    
    with open('./transactions/' + filename, "w") as f:
        for removeline in lines:
            if  removeline != oldline:
                f.write(removeline)
    f.close

    with open('./transactions/' + filename, "a") as f:
        f.write(newline)
    f.close()
    


if __name__ == '__main__':
    ship
