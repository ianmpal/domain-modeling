//
//  Money.swift
//  domain-modeling
//
//  Created by Ian Palmgren on 10/15/15.
//  Copyright © 2015 Ian Palmgren. All rights reserved.
//

import Foundation

// Struct Money

struct Money: CustomStringConvertible, Mathematics {
    var amount: Double
    var currency: String
    var description: String
    
    init (amount: Double, currency: String) {
        self.amount = amount
        self.currency = currency
        self.description = currency + String(amount)
    }
    
    
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
