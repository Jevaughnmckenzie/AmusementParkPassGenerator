//
//  Guest.swift
//  SingleViewAppSwiftTemplate
//
//  Created by Jevaughn McKenzie on 3/3/17.
//  Copyright © 2017 Treehouse. All rights reserved.
//

import Foundation



protocol VerifiableByBirthday {
    var birthday: Date? { get }
    var calender: Calendar { get }
    func checkBirthday() throws
}

extension VerifiableByBirthday {
    var calendar: Calendar { Calendar.current }
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
    
    func checkIfIndividual(_: Bool) throws
}


protocol RideAccessible {
    var canAccessAllRides: Bool { get set }
    var canSkipRideLines: Bool { get set }
    
}

protocol Accessible: AreaAccessible, RideAccessible {
    
}

class Guest: Accessible, Discountable {
    var canEnterAmusementAreas: Bool = true
    var canEnterKitchenAreas: Bool = false
    var canEnterRideControlAreas: Bool = false
    var canEnterMaintenanceAreas: Bool = false
    var canEnterOfficeArea: Bool = false
    
    var canAccessAllRides: Bool = true
    var canSkipRideLines: Bool = false
 
    var foodDiscount: Float? = nil
    var merchandiseDiscount: Float? = nil
    
    func checkIfIndividual(_ canAccess: Bool) throws {
        guard canAccess == true else {
            throw InfoError.unauthorizedAccess(inObject: self, description: "Individual is not authorized to enter")
        }
    }
}

class Classic: Guest {}

class VIP: Guest {
    
    override init() {
        super.init()
        canSkipRideLines = true
        
        foodDiscount =  0.10
        merchandiseDiscount = 0.20
    }
}

class Child: Guest, VerifiableByBirthday {
    
    var birthday: Date?
    var calender: Calendar
    
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





































