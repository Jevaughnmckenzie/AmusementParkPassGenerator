//
//  AccessAreas.swift
//  AmusementParkPassGenerator
//
//  Created by Jevaughn McKenzie on 3/5/17.
//  Copyright © 2017 Treehouse. All rights reserved.
//


enum AreaAccess {
    case amusement
    case kitchen
    case rideControl
    case maintenance
    case office
}

enum RideAccess {
    case allRidesAccess
    case skipPrivilage
}

enum Discount {
    case food(Int)
    case merchendise(Int)
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

protocol AccessCheckable: AreaAccessible, RideAccessible {
    
}


























