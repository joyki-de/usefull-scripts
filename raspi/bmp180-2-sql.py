#!/usr/bin/env python

import os
import time
import datetime
import glob
import pymysql
from time import strftime
import Adafruit_BMP.BMP085 as BMP085

sensor = BMP085.BMP085()

#Variables for MySQL
db = pymysql.connect(host="IP-Adress or localhost", user="Username", passwd="Password", db="Database") 
cur = db.cursor()

def dateTime(): #get UNIX time
        secs = float(time.time())
        secs = secs*1000
        return secs

def tempRead(): #read temperature, return float with 3 decimal places
        degrees = float('{0:.3f}'.format(sensor.read_temperature()))
        return degrees

def pressRead(): #read pressure, return float with 3 decimal places
        pascals = float('{0:.3f}'.format(sensor.read_pressure()/100))
        return pascals

secs = dateTime()
temperature = tempRead()
pressure = pressRead()

sql = ("""INSERT INTO Name_of_The_tables (unixdatetime,temperature,pressure) VALUES (%s,%s,%s)""", (secs, temperature, pressure))

try:
    print("Writing to the database...")
    cur.execute(*sql)
    db.commit()
    print("Write complete")

except:
    db.rollback()
    print("We have a problem")

cur.close()
db.close()

print(secs)
print(temperature)
print(pressure)
