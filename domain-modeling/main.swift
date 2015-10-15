//
//  main.swift
//  domain-modeling
//
//  Created by Ian Palmgren on 10/14/15.
//  Copyright © 2015 Ian Palmgren. All rights reserved.
//

import Foundation

/*

Create a value type: Money

–  Properties:

•amount

•currency

–  Methods:

convert: convert from one currency to another

add, subtract: do the math thing

–  Currencies are convertd at the following exchange rate:

1 USD = .5 GBP (2 USD = 1 GBP)
1 USD = 1.5 EUR (2 USD = 3 EUR)
1 USD = 1.25 CAN (4 USD = 5 CAN)
you'll have to work out the rest of the math on your own

–  If you use a String for currency, make sure that only the four listed are accepted

–  Note that it is totally acceptable to add/subtract GBP to EUR or CAN

meaning, you'll need to convert when adding/subtracting

*/

struct Money {
    var amount: Int
    var currency: String
    
    func convert(amount: Double, curr1: String, curr2: String) -> Double {
        
       
        switch curr1 {
            case "USD":
                switch curr2 {
                    case "GBP":
                        return amount * 0.5
                    case "EUR":
                        return amount * 1.5
                    case "CAN":
                        return amount * 1.25
                    default:
                        return amount
                }
            case "GBP":
                switch curr2 {
                    case "USD":
                        return amount * 2.0
                    case "EUR":
                        return amount * 3.0
                    case "CAN":
                        return amount * 2.5
                    default:
                        return amount
                }
            case "EUR":
                switch curr2 {
                    case "GBP":
                        return amount * (1/3)
                    case "USD":
                        return amount * (2/3)
                    case "CAN":
                        return amount * (5/6)
                    default:
                        return amount
                }
            case "CAN":
                switch curr2 {
                    case "GBP":
                        return amount * 2/5
                    case "EUR":
                        return amount * 1.2
                    case "USD":
                        return amount * 4/5
                    default:
                        return amount
                }
            default:
                return 2.0
        
        }
    }
    
    
    
    func add(value1: Int, value2: Int) -> Int {
        return value1 - value2
    }
    
    func sub(value1: Int, value2: Int) -> Int {
        return value1 - value2
    }
}
    


var money1 = Money(amount: 1, currency: "USD")

print(money1.convert(3.0, curr1: "EUR", curr2: "USD"))



/*
Create a class: Job

– Properties:

    •title 
    •salary

– Salaries can be either per-hour or per-year – 

Methods:

    •calculateIncome, which should accept a number of hours worked this year

    if this is a per-year salary, then ignore the hours

    •raise, which will bump up the salary by the passed percentage

*/



struct Job {
    var title: String
    var salaryHourly: Int
    var salaryYearly: Int
    
    func calculateIncome(hoursWorked: Int) -> String {
        
        return "$\(hoursWorked * salaryHourly)"
        
    }
    
    mutating func raise(percentRaise: Int) {
        salaryHourly = salaryHourly * percentRaise
    }
    
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

//var job1 = Job(title: "contractor")
var sp1 = Spouse(name: "margaret")
//var p1 = Person (firstName: "Ian", lastName: "Palmgren", age: 19, job: job1, spouse: sp1)
//var p2 = Person (firstName: "Ian", lastName: "Palmgren", age: 24, job: Job, spouse: Spouse)


//print(p1.toString())



