//
//  main.swift
//  domain-modeling
//
//  Created by Ian Palmgren on 10/14/15.
//  Copyright © 2015 Ian Palmgren. All rights reserved.
//

import Foundation


// Begin test code


var money1 = Money(amount: 4, currency: "USD")
var money2 = Money(amount: 8, currency: "GBP")

print(money1.convert(2.5, curr1: "CAN", curr2: "GBP"))
print(money1.sub(1.25, curr: "CAN"))
print(money1.add(1.25, curr: "EUR"))
print(money2.convert(6.8, curr1: "EUR", curr2: "CAN"))
print(money2.sub(14.2, curr: "GBP"))


print("\n")

var job1 = Job(title: "Electrician", salary: Job.Salary.PerYear(20000.0))
var job2 = Job(title: "Designer", salary: Job.Salary.PerHour(10))

var p1 = Person(firstName: "Joe", lastName: "Smith", age: 22, job: job1, spouse: nil)
var p2 = Person(firstName: "Jenny", lastName: "Prathers", age: 22, job: job2, spouse: p1)

print("\n")
print("\(p1.toString()) \n")
print("\(p2.toString()) \n")

var raise = 10.0
var beforeRaise = p2.job?.calculateIncome(1.0)
print("Income is \(beforeRaise!)")
print("Raising income by \(raise)%")

p2.job?.raise(raise)
var afterRaise = p2.job?.calculateIncome(1.0)

print("Income after 10% raise is \(afterRaise!)")


var family: [Person] = [p1, p2]
var fam = Family(members: family)

print("\n")

print(fam.householdIncome())

print("There are \(fam.members.count) members in the family")
print("The family is having a child\n")
fam.haveChild()
print("\n")
print("Now there are \(fam.members.count) members in the family")

print("\n")