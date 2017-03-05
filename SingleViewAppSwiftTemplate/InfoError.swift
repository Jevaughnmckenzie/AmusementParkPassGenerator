//
//  InfoError.swift
//  AmusementParkPassGenerator
//
//  Created by Jevaughn McKenzie on 3/3/17.
//  Copyright © 2017 Treehouse. All rights reserved.
//

import Foundation


enum InfoError: Error {
    case unauthorizedAccess(inObject: AnyObject , description: String)
    case limitedRideAccess(inObject: AnyObject , description: String)
    case missingInformation(inObject: AnyObject , description: String)
    case invalidBirthday(inObject: AnyObject, description: String)
}






















































