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



class Employee: Accessible, Discountable, FrequentVisitor {
    var firstName: String?
    var lastName: String?
    
    var streetAddress: String?
    var city: String?
    var state: String?
    var zipcode: String?
    
    var canEnterAmusementAreas: Bool = true
    var canEnterKitchenAreas: Bool = false
    var canEnterRideControlAreas: Bool = false
    var canEnterMaintenanceAreas: Bool = false
    var canEnterOfficeArea: Bool = false
    
    var canAccessAllRides: Bool = true
    var canSkipRideLines: Bool = false
    
    var foodDiscount: Float? = 0.15
    var merchandiseDiscount: Float? = 0.25
    
    init(firstName: String, lastName: String, fullAddress: FullAddress) {
        self.firstName = firstName
        self.lastName = lastName
        
        self.streetAddress = fullAddress.streetAddress
        self.city = fullAddress.city
        self.state = fullAddress.state
        self.zipcode = fullAddress.zipcode
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
    
    func checkIfIndividual(_ canAccess: Bool) throws {
        guard canAccess == true else {
            throw InfoError.unauthorizedAccess(inObject: self, description: "Individual is not authorized to enter")
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

















































