# Author  : freeman
# Date    : 2020.04.21
# Version : 0.0.1
# Desc    : Big 4 Concepts of OOP
#         : 1) Abstration; 2) Encapsulation; 3) Inheritance; 4) Polymorphism
#         : 1: real world attributes and behaviors, classes and objs
#         : 2: data hiding: private, public data members
#         : 3: inherite values and behaviors from parent class(es)
#         : 4: having the same behaviors or methods in the child class
#         : python OO programming -- simple cow class 
###################################################################

import os
import sys
import time

class Cow:

    # Global Variables
    # public data members

    # default Constructor
    def __init__(self, breed, age, color):
        self.breed = breed
        self.age = age
        self.color = color
        self.food = "grass"
        self.lang = "moo"
        self.hours = 5

    def getBreed(self):
        return self.breed

    def getAge(self):
        return self.age

    def getColor(self):
        return self.color

    def speak(self):
        return self.lang

    def sleep(self):
        return self.hours

    def eat(self):
        return self.food

    def __str__(self):
        return str(self.breed) + " " + str(self.age) + " " + str(self.color)


def main():
    adam = Cow("angus", 3, "black")
    print(type(adam))
    print("Adam can speak: ", adam.speak(), " often times.")
    print("Adam will sleep: " , str(adam.sleep()), " hours per day.")
    print("Adam will eat: ", adam.eat()," most of the time.")
    print("Adam is a ", adam.__str__().split()[0], " Cow.")


if __name__ == "__main__":
    main()
