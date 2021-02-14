import os
import json
import sys
import random
from datetime import date
import time


def fishentry():
    os.system('cls')
    print('-------------------------------------------------------------------')
    print('-------------------------------------------------------------------')
    print('Team - 2 Project - Fish Tracking')
    print('-------------------------------------------------------------------')
    print('-------------------------------------------------------------------')
    transactionid = str(random.randint(0, 10000))
    os.system('clear')
    today = date.today()
    d4 = today.strftime("%b-%d-%Y")
    t = time.localtime()
    current_time = time.strftime("%H-%M-%S", t)
    print('Transaction ID for the same: ' + d4 + '-' + current_time + '-' + transactionid)

    filename = 'fish.txt'
    if os.path.exists('./transactions/' + filename):
        append_write = 'a'
    else:
        append_write = 'w'
    
    fisher_lastname = input("Please enter fisher last name: ")
    fisher_firstname = input("Please enter fisher first name: ")
    fisher_rfidtag = input("Please enter fisher RFID TAG: ")
    fisher_catch_location = input("Please enter the location where fish is caught: ")
    fisher_fish_type = input("Please enter fish type: ")
    fisher_fish_weight = input("Please enter fish weight in Kgs: ")
    fisher_fish_price = input("Please enter fish price in USD: ")
    fisher_fish_fat_percentage = input("Please enter fish fat percentage: ")
    fisher_fish_entry_date = d4
    fisher_fish_entry_time = current_time
    fisher_fish_transaction_id = d4 + '-' + current_time + '-' + transactionid

    fishupdate = open('./transactions/' + filename, append_write)
    fishupdate.write("TransactionID: " + fisher_fish_transaction_id + ', ' + "Last Name: " + fisher_lastname + ', ' + "First Name: " + fisher_firstname + ', ' + "RFID TAG: " + fisher_rfidtag + ', ' + "Caught Location: " + fisher_catch_location + ', ' + "Fish Type: " +
                     fisher_fish_type + ', ' + "Fish Weight: " + fisher_fish_weight + ', ' + "Fish Price: " + fisher_fish_price + ', ' + "Fish Fat Percentage: " + fisher_fish_fat_percentage + ', ' + "Entry Date: " + fisher_fish_entry_date + ', ' + "Entry Time: " + fisher_fish_entry_time + ', ' '\n')
    fishupdate.close()  


if __name__ == '__main__':
    fishentry
