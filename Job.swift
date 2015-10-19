//
//  Job.swift
//  domain-modeling
//
//  Created by Ian Palmgren on 10/15/15.
//  Copyright © 2015 Ian Palmgren. All rights reserved.
//

import Foundation


// Class Job

class Job {
    var title: String
    var salary: Salary
    var description: String
    
    enum Salary {
        case PerHour(Double)
        case PerYear(Double)
    }
    
    init (title: String, salary: Salary) {
        self.title = title
        self.salary = salary
        self.description = "Title: \(title). Salary: \(salary)"
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
        case .PerHour(let amount):
            self.salary = Salary.PerHour(amount * ((percentRaise/100)+1))
        }
        
    }
}

