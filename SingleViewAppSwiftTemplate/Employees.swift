//
//  Employees.swift
//  AmusementParkPassGenerator
//
//  Created by Jevaughn McKenzie on 3/3/17.
//  Copyright © 2017 Treehouse. All rights reserved.
//

import Foundation

protocol VerifiableByName {
    var firstName: String { get }
    var lastName: String { get }
}

protocol VerifiableByAddress {
    var streetAddress: String { get set }
    var city: String { get set }
    var state: String { get set }
    var zipcode: String { get set }
}

protocol FrequentVisitor: VerifiableByName, VerifiableByAddress {
    
}

struct FullAddress: VerifiableByAddress {
    var streetAddress: String
    var city: String
    var state: String
    var zipcode: String
    
    init(streetAddress: String, city: String, state: String, zipcode: String) {
        self.streetAddress = streetAddress
        self.city = city
        self.state = state
        self.zipcode = zipcode
    }
}

class Employee: Accessible, Discountable, FrequentVisitor {
    var firstName: String
    var lastName: String
    
    var streetAddress: String
    var city: String
    var state: String
    var zipcode: String
    
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

class Maintenance: Employee {
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

















































