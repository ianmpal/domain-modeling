//
//  main.swift
//  domain-modeling
//
//  Created by Ian Palmgren on 10/14/15.
//  Copyright © 2015 Ian Palmgren. All rights reserved.
//

import Foundation


extension Double {
    var USD: Money { return Money(amount: self, currency: "USD") }
    var EUR: Money { return Money(amount: self, currency: "EUR") }
    var GBP: Money { return Money(amount: self, currency: "GBP") }
    var CAN: Money { return Money(amount: self, currency: "CAN") }
}

print("// Begin Domain-Modeling Pt. 2 Tests\n")

print("// Money Test\n")
var m1 = 10.EUR
var m2 = 45.GBP
var m3 = 7.CAN
var m4 = 3.USD
print("Test of EUR10.0: " + m1.description)
print("Test of GBP45.0: " + m2.description)
print("Test of CAN7.0: " + m3.description)
print("Test of USD3.0: " + m4.description)
print("")
print("Adding GBP10.0 to EUR10.0 = " + String(m1.currency) + String(m1.add(10, curr: "GBP")))
print("Subtracting CAN0.5 from CAN7.0 = " + String(m3.currency) + String(m3.sub(0.5, curr: "CAN")))
print("")


print("// Job Test\n")

var job1 = Job(title: "Electrician", salary: Job.Salary.PerYear(20000.0))
var job2 = Job(title: "Designer", salary: Job.Salary.PerHour(10))
var job3 = Job(title: "Musician", salary: Job.Salary.PerYear(60000.0))
var job4 = Job(title: "Chef", salary: Job.Salary.PerHour(70))

print(job1.description)
print(job2.description)
print(job3.description)
print(job4.description)
print("")

print("// Person Test\n")

var p1 = Person(firstName: "Joe", lastName: "Smith", age: 22, job: job1, spouse: nil)
var p2 = Person(firstName: "Jenny", lastName: "Prathers", age: 22, job: job2, spouse: p1)
var p3 = Person(firstName: "Kelly", lastName: "Smith", age: 22, job: job3, spouse: nil)
var p4 = Person(firstName: "John", lastName: "Smith", age: 22, job: job4, spouse: p3)
p1.spouse = p2
p3.spouse = p4

print(p1.description + "\n")
print(p2.description + "\n")
print(p3.description + "\n")
print(p4.description + "\n")
print("")

print("// Family Test\n")

var family = [p1, p2, p3, p4]
var fam = Family(members: family)


print(fam.description)
print("")
print("")


// Domain-Modeling Pt.1

print("// Begin Domain-Modeling Pt. 1 Tests\n")

print("// Money Test\n")

var money1 = Money(amount: 4, currency: "USD")
var money2 = Money(amount: 8, currency: "GBP")

var convert1 = money1.convert(2.5, curr1: "CAN", curr2: "GBP")
var sub1 = money1.sub(1.25, curr: "CAN")
var add1 = money1.add(2.3, curr: "EUR")
var convert2 = money2.convert(6.8, curr1: "EUR", curr2: "CAN")
var sub2 = money2.sub(14.2, curr: "GBP")



print("After conversion, $2.5 CAN is equal to \(convert1) GBP")
print("After subtracting $1.25 CAN from $\(money1.amount) USD we have $\(sub1) USD left.")
print("After adding $2.3 EUR, we have $\(add1) USD left.")
print("After conversion, 6.8 EUR is equal to \(convert2) CAN")
print("After subtracting 14.2 GBP, our balance is \(sub2) GBP.")

print("\n")

print("// Job Test\n")


var job5 = Job(title: "Electrician", salary: Job.Salary.PerYear(20000.0))
var job6 = Job(title: "Designer", salary: Job.Salary.PerHour(10))

var p5 = Person(firstName: "Joe", lastName: "Smith", age: 22, job: job5, spouse: nil)
var p6 = Person(firstName: "Jenny", lastName: "Prathers", age: 22, job: job6, spouse: p1)
var p7 = Person(firstName: "Baby", lastName: "Smith", age: 0, job: nil, spouse: nil)

print("\(p1.toString()) \n")
print("\(p2.toString()) \n")
print("\(p3.toString()) \n")

var raise = 10.0
var beforeRaise = p2.job?.calculateIncome(1.0)
print("Income is $\(beforeRaise!)")
print("Raising income by \(raise)%")

p2.job?.raise(raise)
var afterRaise = p2.job?.calculateIncome(1.0)

print("Income after 10% raise is $\(afterRaise!)")
print("")

print("// Family Test\n")
var family2: [Person] = [p1, p2]
var fam2 = Family(members: family2)

print(fam.householdIncome())
print("There are \(fam.members.count) members in the family")
print("The family is having a child!")
fam.haveChild()
print("Now there are \(fam.members.count) members in the family")

print("\n")

