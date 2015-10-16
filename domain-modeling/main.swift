//
//  main.swift
//  domain-modeling
//
//  Created by Ian Palmgren on 10/14/15.
//  Copyright © 2015 Ian Palmgren. All rights reserved.
//

import Foundation


// Struct Money

struct Money {
    var amount: Double
    var currency: String
    
    
    // Convert is generalized so that you can input any value in any currency, and it will return the appropriate
    // value based on the secondary currency you want it converted into
    
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
    
   
}
    

//
//var money1 = Money(amount: 4, currency: "USD")
//
//print(money1.convert(2.5, curr1: "CAN", curr2: "GBP"))
//print(money1.sub(1.25, curr: "CAN"))
//print(money1.add(1.25, curr: "EUR"))


// Class Person

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
            print("Persons under age 16 are not allowed to work.")
        }
        
        if age >= 18 {
            self.spouse = spouse
        } else {
            self.spouse = nil
            print("Persons under age 18 are not allowed to get married.")
        }
    }
    
    func toString() -> String {
        if age < 16 {
            return "Name: \(firstName) \(lastName) \nAge: \(age) \nJob: US Citizens under 16 are not allowed to work \nSpouse: US Citizens under 18 are not allowed to get married)"
        } else if age > 16 && age < 18 {
            return "Name: \(firstName) \(lastName) \nAge: \(age) \nJob: \(job?.title) \nSpouse: Not over 18"
        } else {
            return "Name: \(firstName) \(lastName) \nAge: \(age) \nJob: \(job?.title) \nSpouse: \(spouse?.firstName)"
        }
    }
    
   
}


// Class Job

class Job {
    var title: String
    var salary: Salary
    
    enum Salary {
        case PerHour(Double)
        case PerYear(Double)
    }
    
    init (title: String, salary: Salary) {
        self.title = title
        self.salary = salary
    }
    
    
    func calculateIncome(hoursWorked: Double) -> Double {
        
        switch salary {
        case .PerHour(let amount):
            return amount * hoursWorked
        case .PerYear(let amount):
            return amount
        }
        
    }
    
    
    // Calculation is [salary * (1 + (% raise / 100))]
    
    func raise(percentRaise: Double) -> Void {
        switch salary {
        case .PerYear(let amount):
            self.salary = Salary.PerYear(amount * ((percentRaise/100)+1))
            //return (amount * ((percentRaise/100)+1))
            
        case .PerHour(let amount):
            self.salary = Salary.PerHour(amount * ((percentRaise/100)+1))
        }
        
    }
}


// Class Family

class Family {
    var members = [Person]()
    
    init (members: [Person]) {
        self.members = members
    }
    
    func householdIncome() -> String {
        var totalIncome: Double = 0.0
        
        for person in members {
            if person.job != nil {
                totalIncome += (person.job?.calculateIncome(2000.0))!
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


var job1 = Job(title: "Electrician", salary: Job.Salary.PerYear(20000.0))
var job2 = Job(title: "Electrician", salary: Job.Salary.PerYear(30000.0))
var job2 = Job(title: "Electrician", salary: Job.Salary.PerHour(10.0))



var p1 = Person(firstName: "Joe", lastName: "Smith", age: 22, job: job1, spouse: nil)
var p2 = Person(firstName: "Jenny", lastName: "Prathers", age: 22, job: job2, spouse: p1)


print("Income is \(p2.job?.calculateIncome(40.0))")
p2.job?.raise(20)
print("Income now is \(p2.job?.calculateIncome(40.0))")


//var p3 = Person(firstName: "", lastName: "", age: 0, job: nil, spouse: nil)

//print("\n")
//print("\(p1.toString()) \n")
//print("\(p2.toString()) \n")
//print("\(p3.toString()) \n")


var family: [Person] = [p1, p2]
var fam = Family(members: family)

//print(fam.householdIncome())

//print("There are \(fam.members.count) members in the family")
//fam.haveChild()
//print("Now there are \(fam.members.count) members in the family")
//
//print("\n")








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


