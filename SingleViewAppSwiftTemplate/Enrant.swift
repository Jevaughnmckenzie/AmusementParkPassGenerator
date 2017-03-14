//
//  Enrant.swift
//  SingleViewAppSwiftTemplate
//
//  Created by Jevaughn McKenzie on 3/9/17.
//  Copyright © 2017 Treehouse. All rights reserved.
//

import Foundation


enum EntrantType {
    case guest(GuestType)
    case employee(EmployeeType)
}

enum GuestType {
    case regularGuest
    case vip
    case child
}

enum EmployeeType {
    case foodService
    case rideService
    case maintenance
    case manager
}


struct EntrantInfo {
    var firstName: String?
    var lastName: String?
    
    
    var streetAddress: String?
    var city: String?
    var state: String?
    var zipcode: String?
    
    var birthdayEntered: String?
    let birthdayFormated = DateFormatter()
    var birthdayDate: Date?
    
    init(firstName: String?, lastName: String?, birthday: String?,
         streetAddress: String?, city: String?, state: String?, zipcode: String?) {
        self.firstName = firstName
        self.lastName = lastName
        self.birthdayEntered = birthday
        
        self.streetAddress = streetAddress
        self.city = city
        self.state = state
        self.zipcode = zipcode
        
        birthdayFormated.dateFormat = "MM/dd/yyyy"
        birthdayDate = birthdayFormated.date(from: birthday!)
    }
    
    
    
}

    
    
    
    
    
    
    
    
    
    





















































