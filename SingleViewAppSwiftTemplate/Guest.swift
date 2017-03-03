//
//  Guest.swift
//  SingleViewAppSwiftTemplate
//
//  Created by Jevaughn McKenzie on 3/3/17.
//  Copyright © 2017 Treehouse. All rights reserved.
//

import Foundation



protocol VerifiableByBirthday {
    var birthday: Date { get }
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
    
    var birthday: Date
    
    init(bornOn birthday: Date) {
        self.birthday = birthday
    }
    
}




































