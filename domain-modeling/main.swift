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



struct Job {
    var title: String
    var salary: Double
    
//    func calculateIncome(hoursWorked: Int) -> String {
//        
//        return "$\(hoursWorked * salaryHourly)"
//        
//    }
//    
//    mutating func raise(percentRaise: Int) {
//        salaryHourly = salaryHourly * percentRaise
//    }
    
}

struct Spouse {
    var name: String
    
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

struct Person {
    var firstName : String? // Has to be optional for haveChild method
    var lastName : String?  // Has to be optional for haveChild method
    var age : Int
    var job : Job?
    var spouse: Spouse?
    
    
    init (age: Int) {
        
        self.age = age
    }
    
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
//var sp1 = Spouse(name: "margaret")
//var p1 = Person (firstName: "Ian", lastName: "Palmgren", age: 19, job: job1, spouse: sp1)
//var p2 = Person (firstName: "Ian", lastName: "Palmgren", age: 24, job: Job, spouse: Spouse)


//print(p1.toString())





/*

Create a class: Family

– Properties:

•members (a collection of Persons)

– Methods:

•householdIncome: return the combined income of the entire family

•haveChild: add a new Person to the collection of age 0

there must be one Person in the family who is over age 21 to be legal

*/

struct Family {
    var members = [Person]()
    
    init (membersInit: [Person]) {
        var legalFamily = false
        for member in membersInit {
            if member.age > 21 {
                legalFamily = true
            }
        }
        if legalFamily {
            self.members = membersInit
        } else {
            print("At least one person in the family must be 21 years or older")
        }
    }
    
    
    func householdIncome() -> Double {
        var total: Double = 0
        
        for person in members {
            if person.job?.salary != nil {
                total += (person.job?.salary)!
            }
        }
        return total
        
    }
    
    mutating func haveChild() {
        let newChild = Person(age: 0)
        self.members.append(newChild)
    }
}


var p1 = Person(firstName: "Ian", lastName: "Palmgren", age: 22)
var p2 = Person(firstName: "Steph", lastName: "Morris", age: 16)

var family: [Person] = [p1, p2]
var fam = Family(membersInit: family)


for person in fam.members {
    print(person.firstName!)
}

fam.haveChild()

for person in fam.members {
    print(person)
}





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


