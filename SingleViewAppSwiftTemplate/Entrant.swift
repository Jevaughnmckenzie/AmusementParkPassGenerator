//
//  Employees.swift
//  AmusementParkPassGenerator
//
//  Created by Jevaughn McKenzie on 3/3/17.
//  Copyright © 2017 Treehouse. All rights reserved.
//

import Foundation

protocol VerifiableByName {
    var firstName: String? { get }
    var lastName: String? { get }
    
    func checkName() throws
}

protocol VerifiableByAddress {
    var streetAddress: String? { get set }
    var city: String? { get set }
    var state: String? { get set }
    var zipcode: String? { get set }
    
    func checkAddress() throws
}

protocol FrequentVisitor: VerifiableByName, VerifiableByAddress {
    
}

protocol VerifiableByBirthday {
    var birthday: Date? { get }
    var calendar: Calendar { get }
    func checkBirthday() throws
}


protocol Discountable {
    var foodDiscount: Float? { get set }
    var merchandiseDiscount: Float? { get set }
}

protocol AreaAccessible {
    var canEnterAmusementAreas: Bool { get set }
    var canEnterKitchenAreas: Bool { get set }
    var canEnterRideControlAreas: Bool { get set }
    var canEnterMaintenanceAreas: Bool { get set }
    var canEnterOfficeArea: Bool { get set }
    
    func checkIfIndividual(_: Bool)
}


protocol RideAccessible {
    var canAccessAllRides: Bool { get set }
    var canSkipRideLines: Bool { get set }
    
}

protocol Accessible: AreaAccessible, RideAccessible {
    
}


class Entrant: Accessible, Discountable {
    var canEnterAmusementAreas: Bool = true
    var canEnterKitchenAreas: Bool = false
    var canEnterRideControlAreas: Bool = false
    var canEnterMaintenanceAreas: Bool = false
    var canEnterOfficeArea: Bool = false
    
    var canAccessAllRides: Bool = true
    var canSkipRideLines: Bool = false
    
    var foodDiscount: Float? = nil
    var merchandiseDiscount: Float? = nil
    
    func checkIfIndividual(_ canAccess: Bool)  {
        guard canAccess == true else {
            return print("Individual is not authorized to enter")
        }
    }
}


class RegularGuest: Entrant {}

class VIP: Entrant {
    
    override init() {
        super.init()
        canSkipRideLines = true
        
        foodDiscount =  0.10
        merchandiseDiscount = 0.20
    }
}

class Child: Entrant, VerifiableByBirthday {
    
    var birthday: Date?
    let calendar: Calendar = Calendar.current
    
    init(bornOn birthday: Date?) {
        self.birthday = birthday
    }
    
    func checkBirthday() throws {
        
        let earliestValidBirthday =  calendar.date(byAdding: .year, value: -5, to: Date())!
        
        guard birthday != nil else {
            throw InfoError.missingInformation(inObject: self, description: "A valid date of birth must be entered.")
        }
        
        guard birthday! > Date() else {
            throw InfoError.invalidBirthday(inObject: self, description: "Appeareantly, this child has not been born yet.")
        }
        
        guard birthday! >= earliestValidBirthday else {
            throw InfoError.invalidBirthday(inObject: self, description: "The individual is too old to qualify.")
        }
    }
}



class Employee: Entrant, FrequentVisitor {
    var firstName: String?
    var lastName: String?
    
    var streetAddress: String?
    var city: String?
    var state: String?
    var zipcode: String?
    
    init(firstName: String, lastName: String, fullAddress: FullAddress) {
        self.firstName = firstName
        self.lastName = lastName
        
        self.streetAddress = fullAddress.streetAddress
        self.city = fullAddress.city
        self.state = fullAddress.state
        self.zipcode = fullAddress.zipcode
        
        foodDiscount = 0.15
        merchandiseDiscount = 0.25
    }
    
    
}

extension Employee {
    
    func checkName() throws {
        guard firstName != nil else {
            throw InfoError.missingInformation(inObject: self as AnyObject, description: "Please fill out First Name field.")
        }
        guard lastName != nil else {
            throw InfoError.missingInformation(inObject: self as AnyObject, description: "Please fill out Last Name field.")
        }
    }
    
    func checkIfIndividual(_ canAccess: Bool) {
        guard canAccess == true else {
           return print("Individual is not authorized to enter")
        }
    }
    
    
    func checkAddress() throws {
        guard streetAddress != nil else {
            throw InfoError.missingInformation(inObject: self as AnyObject, description: "Please enter a valid street address.")
        }
        
        guard city != nil else {
            throw InfoError.missingInformation(inObject: self as AnyObject, description: "Please enter a valid city.")
        }
        
        guard state != nil else {
            throw InfoError.missingInformation(inObject: self as AnyObject, description: "Please enter a valid state.")
        }
        
        guard zipcode != nil, zipcode?.characters.count == 5, Int.init(zipcode!) != nil  else {
            throw InfoError.missingInformation(inObject: self as AnyObject, description: "Please enter a valid zipcode.")
        }
    }
}

class FoodServiceWorker: Employee {
    override init(firstName: String, lastName: String, fullAddress: FullAddress) {
        super.init(firstName: firstName, lastName: lastName, fullAddress: fullAddress)
        
        canEnterKitchenAreas = true
        
    }
}

class RideServiceWorker: Employee {
    override init(firstName: String, lastName: String, fullAddress: FullAddress) {
        super.init(firstName: firstName, lastName: lastName, fullAddress: fullAddress)
        
        canEnterRideControlAreas = true
    }
}

class MaintenanceWorker: Employee {
    override init(firstName: String, lastName: String, fullAddress: FullAddress) {
        super.init(firstName: firstName, lastName: lastName, fullAddress: fullAddress)
        
        canEnterRideControlAreas = true
        canEnterKitchenAreas = true
        canEnterMaintenanceAreas = true
    }
}

class Manager: Employee {
    override init(firstName: String, lastName: String, fullAddress: FullAddress) {
        super.init(firstName: firstName, lastName: lastName, fullAddress: fullAddress)
        
        canEnterRideControlAreas = true
        canEnterKitchenAreas = true
        canEnterMaintenanceAreas = true
        canEnterOfficeArea = true
        
        foodDiscount = 0.25
    }
}


















































