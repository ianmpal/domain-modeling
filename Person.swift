//
//  Person.swift
//  domain-modeling
//
//  Created by Ian Palmgren on 10/15/15.
//  Copyright © 2015 Ian Palmgren. All rights reserved.
//

import Foundation


// Class Person

class Person: CustomStringConvertible {
    var firstName: String
    var lastName: String
    var age = 0
    var job: Job?
    var spouse: Person?
    var description: String {
        return toString()
    }
    
    
    init (firstName: String, lastName: String, age: Int, job: Job?, spouse: Person?) {
        self.firstName = firstName
        self.lastName = lastName
        self.age = age
        if age >= 16 {
            self.job = job
        } else {
            self.job = nil
            //print("Persons under age 16 are not allowed to work.")
        }
        
        if age >= 18 {
            self.spouse = spouse
        } else {
            self.spouse = nil
            //print("Persons under age 18 are not allowed to get married.")
        }
        //self.description = "Name: \(firstName) \(lastName) \nAge: \(age) \nJob: \((job?.title)!) \nSpouse: \(spouse?.firstName)"

    }
    
    func toString() -> String {
        if age < 16 {
            return "Name: \(firstName) \(lastName) \nAge: \(age) \nJob: US Citizens under 16 are not allowed to work \nSpouse: US Citizens under 18 are not allowed to get married"
        } else if age > 16 && age < 18 {
            return "Name: \(firstName) \(lastName) \nAge: \(age) \nJob: \((job?.title)!) \nSpouse: Not over 18"
        } else {
            return "Name: \(firstName) \(lastName) \nAge: \(age) \nJob: \((job?.title)!) \nSpouse: \(spouse?.firstName)"
        }
    }
    
    
}

