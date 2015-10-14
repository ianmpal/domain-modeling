//
//  main.swift
//  domain-modeling
//
//  Created by Ian Palmgren on 10/14/15.
//  Copyright © 2015 Ian Palmgren. All rights reserved.
//

import Foundation


struct Job {
    var title: String
    var salaryHourly: Int
    var slarlyYearly: Int
    
    func calculateIncome(hoursWorked: Int) -> String {
        
    }

struct Spouse {
    var name: String
    
}


struct Person {
    let firstName : String
    let lastName : String
    var age : Int
    var job : Job?
    var spouse: Spouse?
  
    
    init (firstName: String, lastName: String, age: Int) {
        self.firstName = firstName
        self.lastName = lastName
        self.age = age
    }
    
    init (firstName: String, lastName: String, age: Int, job: Job, spouse: Spouse) {
        self.firstName = firstName
        self.lastName = lastName
        self.age = age
        self.job = job
        self.spouse = spouse
    }
    
    
    func toString() -> String {
        if age < 16 {
            return "Name: \(firstName) \(lastName) \nAge: \(age) \nJob: US Citizens under 16 are not allowed to work \nSpouse: US Citizens under 18 are not allowed to get married)"
        } else if age > 16 && age < 18 {
            return "Name: \(firstName) \(lastName) \nAge: \(age) \nJob: \(job!) \nSpouse: Not over 18"
        } else {
            return "Name: \(firstName) \(lastName) \nAge: \(age) \nJob: \(job!) \nSpouse: \(spouse!)"
        }
    }
    
   
}

var job1 = Job(title: "contractor")
var sp1 = Spouse(name: "margaret")
var p1 = Person (firstName: "Ian", lastName: "Palmgren", age: 19, job: job1, spouse: sp1)
//var p2 = Person (firstName: "Ian", lastName: "Palmgren", age: 24, job: Job, spouse: Spouse)


print(p1.toString())



