#!/usr/bin/env python3

#imports go here
import csv
import json

def convert(csvFilePath, jsonFilePath, primaryKey):
#read csv file and add to data
    data = {}
    with open(csvFilePath) as csvFile:
        csvReader = csv.DictReader(csvFile)
        for rows in csvReader:
            id = rows[primaryKey]
            data[id] = rows

    #Create new json file and write data on it
    with open(jsonFilePath, 'w') as jsonFile:
        #make it more readable
        jsonFile.write(json.dumps(data, indent=4))

#make it run
if __name__ == "__main__":
    csvFileInput = input ("File to convert: ")#'test_plant_export_numb1.csv'
    primaryKey = input ("ID: ")#'Classification ID'
    jsonFileInput = input ("File to save: ")#'test_plant_export.json'
    convert(csvFileInput, jsonFileInput, primaryKey)

##------------------------------------------------- RESOURCES
