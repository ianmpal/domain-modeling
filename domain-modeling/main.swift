//
//  main.swift
//  domain-modeling
//
//  Created by Ian Palmgren on 10/14/15.
//  Copyright © 2015 Ian Palmgren. All rights reserved.
//

import Foundation



protocol Mathematics {
    func add(value: Double, curr: String) -> Double
    func sub(value: Double, curr: String) -> Double
}


//•add four new extension properties, USD, EUR, GBP, YEN
//
//•each should return a Money
//•each should convert the Double into a Money using
//
//"self" as the amount
//
//– Unit tests!




var moneyUSD = 10.USD.add(5.0, curr: "GBP")

print("Hello " + moneyUSD.description)


var money1 = Money(amount: 4, currency: "USD")
var money2 = Money(amount: 8, currency: "GBP")
print(money1.description)
print(money2.description)

var job1 = Job(title: "Electrician", salary: Job.Salary.PerYear(20000.0))
var job2 = Job(title: "Designer", salary: Job.Salary.PerHour(10))
var job3 = Job(title: "Musician", salary: Job.Salary.PerYear(60000.0))
var job4 = Job(title: "Chef", salary: Job.Salary.PerHour(70))

var p1 = Person(firstName: "Joe", lastName: "Smith", age: 22, job: job1, spouse: nil)
var p2 = Person(firstName: "Jenny", lastName: "Prathers", age: 22, job: job2, spouse: p1)
var p3 = Person(firstName: "Kelly", lastName: "Smith", age: 22, job: job3, spouse: nil)
var p4 = Person(firstName: "John", lastName: "Smith", age: 22, job: job4, spouse: p3)

p1.spouse = p2
p3.spouse = p4




print(job1.description)
print(job2.description)
print(job3.description)
print(job4.description)

var family = [p1, p2, p3, p4]
var fam = Family(members: family)


//print(fam.description)







/*



// Begin test code


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

var job1 = Job(title: "Electrician", salary: Job.Salary.PerYear(20000.0))
var job2 = Job(title: "Designer", salary: Job.Salary.PerHour(10))

var p1 = Person(firstName: "Joe", lastName: "Smith", age: 22, job: job1, spouse: nil)
var p2 = Person(firstName: "Jenny", lastName: "Prathers", age: 22, job: job2, spouse: p1)
var p3 = Person(firstName: "Baby", lastName: "Smith", age: 0, job: nil, spouse: nil)

print("\n")
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

*/