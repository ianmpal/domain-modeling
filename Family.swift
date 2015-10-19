//
//  Family.swift
//  domain-modeling
//
//  Created by Ian Palmgren on 10/15/15.
//  Copyright © 2015 Ian Palmgren. All rights reserved.
//

import Foundation




// Class Family

class Family {
    var members = [Person]()
    var description: String
    
    init (members: [Person]) {
        self.members = members
        self.description = "sux betch"
        print(members[1].age)
        
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

