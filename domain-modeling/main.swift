//
//  main.swift
//  domain-modeling
//
//  Created by Ian Palmgren on 10/14/15.
//  Copyright © 2015 Ian Palmgren. All rights reserved.
//

import Foundation

struct Money {
    var amount: Double
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
                return amount * (2/5)
            case "EUR":
                return amount * 1.2
            case "USD":
                return amount * (4/5)
            default:
                return amount
            }
        default:
            return 0.0 // User input error, defaults to 0.0
        }
    }
    
    func add(value: Double, curr: String) -> Double {
        if self.currency == curr {
            return self.amount + value
        }
        else {
            return self.amount + self.convert(value, curr1: curr, curr2: self.currency)
            
        }
    }
    
    func sub(value: Double, curr: String) -> Double {
        if self.currency == curr {
            return self.amount - value
        }
        else {
            return self.amount - self.convert(value, curr1: curr, curr2: self.currency)
            
        }
    }
    
//    func add(value1: Double, curr1: String, value2: Double, curr2: String) -> Double {
//        if curr1 == curr2 {
//            return value1 + value2
//        }
//        else {
//            return value1 + self.convert(value2, curr1: curr2, curr2: curr1)
//            
//        }
//    }
//    
//    func sub(value1: Double, curr1: String, value2: Double, curr2: String) -> Double {
//        if curr1 == curr2 {
//            return value1 - value2
//        }
//        else {
//            return value1 - self.convert(value2, curr1: curr2, curr2: curr1)
//            
//        }
//    }
    
   
}
    


//var money1 = Money(amount: 4, currency: "USD")

//print(money1.convert(2.5, curr1: "CAN", curr2: "GBP"))

//print(money1.sub(1.25, curr: "CAN"))



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



class Job {
    var title: String
    var salary: Double
    
    init (title: String, salary: Double) {
        self.title = title
        self.salary = salary
    }
    
    enum SalaryType {
        case PerHour(Double)
        case PerYear(Double)
    }
    
//    func calculateIncome(hoursWorked: Int) -> String {
//        
//        switch SalaryType.self {
//        case .PerHour(salary):
//            print("hello")
//        case .PerYear(salary):
//            print("hello2")
//        }
//        
//    }
    
    func raise(percentRaise: Double) {
        salary += (salary * percentRaise)
    }
    
}



/*
Create a class: Person

–  It have the following properties:

•firstName •lastName
•age
•job (Job) •spouse (Person)

–  Methods:

•display a string representation of Person (toString())

–  Note that if the Person is under age 16, they cannot have a job

–  Note that if the Person is under age 18, they cannot have a spouse

*/

class Person {
    var firstName: String
    var lastName: String
    var age = 0
    var job: Job?
    var spouse: Person?
    
    
    init (firstName: String, lastName: String, age: Int, job: Job?, spouse: Person?) {
        self.firstName = firstName
        self.lastName = lastName
        self.age = age
        if age >= 16 {
            self.job = job
        } else {
            self.job = nil
            print("Persons under age 16 are not allowed to work")
        }
        
        if age >= 18 {
            self.spouse = spouse
        } else {
            self.spouse = nil
            print("Persons under age 18 are not allowed to get married")
        }
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



/*

Create a class: Family

– Properties:

•members (a collection of Persons)

– Methods:

•householdIncome: return the combined income of the entire family

•haveChild: add a new Person to the collection of age 0

there must be one Person in the family who is over age 21 to be legal

*/

class Family {
    var members = [Person]()
    
    init (membersArray: [Person]) {
        self.members = membersArray
    }
    
    func householdIncome() -> String {
        var totalIncome: Double = 0.0
        
        for person in members {
            print(person.job?.salary)
            if person.job?.salary != nil {
                totalIncome += person.job!.salary
            }
        }
        return "Total Household Income = $\(totalIncome)"
    }
    
    func haveChild() {
        var legalFamily = false
        for member in members {
            if member.age > 21 {
                legalFamily = true
            }
        }
        if legalFamily {
            let newChild = Person(firstName: "", lastName: "", age: 0, job: nil, spouse: nil)
            self.members.append(newChild)
        } else {
            print("At least one person in the family must be 21 years or older")
        }
    }
}


var job1 = Job(title: "Electrician", salary: 6000.0)
var job2 = Job(title: "Designer", salary: 6000.0)


var p1 = Person(firstName: "Joe", lastName: "Smith", age: 22, job: job1, spouse: nil)
var p2 = Person(firstName: "Jenny", lastName: "Prathers", age: 22, job: job2, spouse: p1)



var family: [Person] = [p1, p2]
var fam = Family(membersArray: family)

print("There are \(fam.members.count) members in the family")
fam.haveChild()
print("Now there are \(fam.members.count) members in the family")

print("\n")



print(fam.householdIncome())







//        switch curr1 {
//            case "USD":
//                switch curr2 {
//                    case "GBP":
//                        return "£\(String(amount * 0.5))"
//                    case "EUR":
//                        return "€\(String(amount * 1.5))"
//                    case "CAN":
//                        return "$\(String(amount * 1.25))"
//                    default:
//                        return "$\(String(amount))"
//                }
//            case "GBP":
//                switch curr2 {
//                    case "USD":
//                        return "$\(String(amount * 2.0))"
//                    case "EUR":
//                        return "€\(String(amount * 3.0))"
//                    case "CAN":
//                        return "$\(String(amount * 2.5))"
//                    default:
//                        return "£\(String(amount))"
//                }
//            case "EUR":
//                switch curr2 {
//                    case "GBP":
//                        return "£\(String(amount * (1/3)))"
//                    case "USD":
//                        return "$\(String(amount * (2/3)))"
//                    case "CAN":
//                        return "$\(String(amount * (5/6)))"
//                    default:
//                        return "€\(String(amount))"
//                }
//            case "CAN":
//                switch curr2 {
//                    case "GBP":
//                        return "£\(String(amount * (2/5)))"
//                    case "EUR":
//                        return "€\(String(amount * 1.2))"
//                    case "USD":
//                        return "$\(String(amount * (4/5)))"
//                    default:
//                        return "$\(String(amount))"
//                }
//            default:
//                return "Please enter values in USD, GBP, EUR, or CAN."
//
//        }


