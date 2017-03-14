//
//  Pass.swift
//  SingleViewAppSwiftTemplate
//
//  Created by Jevaughn McKenzie on 3/9/17.
//  Copyright © 2017 Treehouse. All rights reserved.
//

import Foundation

struct Pass {
    let description = "Pass"
    
    let entrant: EntrantType
    let personalInfo: EntrantInfo
    
    init(entrant: EntrantType, personalInfo: EntrantInfo) {
        self.entrant = entrant
        self.personalInfo = personalInfo
    }
    
    
    
    func getAccessPrivileges() throws -> [AccessPermission] {
        
        // MARK: Entrant Information Error Handeling
        switch entrant {
        case .employee:
            guard personalInfo.firstName != nil else {
                throw InfoError.missingInformation(inObject: personalInfo.description, description: "Please provide a First Name.")
            }
            
            guard personalInfo.lastName != nil else {
                throw InfoError.missingInformation(inObject: personalInfo.description, description: "Please provide a Last Name.")
            }
            
            guard personalInfo.streetAddress != nil else {
                throw InfoError.missingInformation(inObject: personalInfo.description, description: "Please provide a valid street address.")
            }
            
            guard personalInfo.city != nil else {
                throw InfoError.missingInformation(inObject: personalInfo.description, description: "Please provide a valid U.S. city.")
            }
            
            guard personalInfo.state != nil else {
                throw InfoError.missingInformation(inObject: personalInfo.description, description: "Please provide a valid U.S. state.")
            }
            
            guard personalInfo.zipcode != nil, personalInfo.zipcode?.characters.count == 5, Int.init(personalInfo.zipcode!) != nil  else {
                throw InfoError.missingInformation(inObject: personalInfo.description, description: "Please provide a valid U.S. zipcode.")
            }
            
        case .guest(.child):
            
            let earliestValidBirthday =  Calendar.current.date(byAdding: .year, value: -5, to: Date())!
            
            guard personalInfo.birthdayDate != nil else {
                throw InfoError.missingInformation(inObject: personalInfo.description, description: "Please provide a valid birthday.")
            }
            guard (personalInfo.birthdayDate)! < Date() else {
                throw InfoError.invalidBirthday(inObject: personalInfo.description, description: "Appearently, this individual has not been born yet.")
            }
            
            guard (personalInfo.birthdayDate)! >= earliestValidBirthday else {
                throw InfoError.invalidBirthday(inObject: personalInfo.description, description: "This individual is too old to be entered as a Free Child.")
            }
            
        default:
            break
        }
        
        switch entrant {
            
        case .guest(let guestType) :
            switch guestType {
            case .regularGuest, .child:
                return [.areaAccess(.amusement), .rideAccess(.allRides), .ridePriority(.standard)]
            case .vip:
                return [.areaAccess(.amusement), .rideAccess(.allRides), .ridePriority(.skipPrivilege), .discountAccess(.food, 10), .discountAccess(.merchandise, 20)]
            }
            
        case .employee(let employeeType) :
            switch employeeType {
            case .foodService :
                return [.areaAccess(.amusement), .areaAccess(.kitchen), .rideAccess(.allRides), .ridePriority(.standard), .discountAccess(.food, 15), .discountAccess(.merchandise, 25)]
            case .rideService :
                return [.areaAccess(.amusement), .areaAccess(.rideControl), .rideAccess(.allRides), .ridePriority(.standard), .discountAccess(.food, 15), .discountAccess(.merchandise, 25)]
            case .maintenance :
                return [.areaAccess(.amusement), .areaAccess(.kitchen), .areaAccess(.rideControl), .areaAccess(.maintenance), .rideAccess(.allRides), .ridePriority(.standard), .discountAccess(.food, 15), .discountAccess(.merchandise, 25)]
            case .manager :
                return [.areaAccess(.amusement), .areaAccess(.kitchen), .areaAccess(.rideControl), .areaAccess(.maintenance), .areaAccess(.office), .rideAccess(.allRides), .ridePriority(.standard), .discountAccess(.food, 25), .discountAccess(.merchandise, 25)]
            }
        }
    }
}


























































