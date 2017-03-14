//
//  Kiosk.swift
//  SingleViewAppSwiftTemplate
//
//  Created by Jevaughn McKenzie on 3/10/17.
//  Copyright © 2017 Treehouse. All rights reserved.
//

import Foundation

protocol Swipeable {
    var pass: Pass { get }
    func swipe() // depending on the kiosk, it returns a string after determining privileges
    func doubleSwipeCheck()
}

class Kiosk: Swipeable {
    
    let pass: Pass
    var timeStampHistory = [String]()
    let calendar = Calendar.current
    
    
    init(pass: Pass) {
        self.pass = pass
    }
    
    func swipe() {
        print("Please pick a more spesific kiosk.")
        
    }
    
    func doubleSwipeCheck() {
        let timestampFormatter = DateFormatter()
        let swipeTimeStamp = Date()
        
        timestampFormatter.dateStyle = .none
        timestampFormatter.timeStyle =  .medium
        let timestamp = timestampFormatter.string(from:swipeTimeStamp)
        
        timeStampHistory.append(timestamp)
        
        // convert elements of timestampHistory back into dates and compare them
        timestampFormatter.dateFormat = "hh:mm Z"
        
        // Does not check for doubleswipe if there is not two timestamps in the timeStampHistory array
        if timeStampHistory.count < 2 {
            swipe()
        } else{
        
        let previousTimeStampIndex = timeStampHistory.count - 2
            let previousTimeStamp = timeStampHistory[previousTimeStampIndex]
        
            let currentTimeStampIndex = timeStampHistory.count - 1
            let currentTimeStamp = timeStampHistory[currentTimeStampIndex]
            
            if let currentSwipe = timestampFormatter.date(from: currentTimeStamp),
            let lastSwipe = timestampFormatter.date(from: previousTimeStamp) {
            
            let nextAbilityToSwipe = lastSwipe.addingTimeInterval(5)
            if currentSwipe >= nextAbilityToSwipe {
                swipe()
            } else {
                    //FIXME: Add an alert message with a more descriptice message
                    print("Please try again later")
                }
            }
        }
    }
    
    func printBirthdayMessage() {
        if let birthdayComparison: ComparisonResult? = calendar.compare((pass.personalInfo.birthdayDate)!, to: Date(), toGranularity: .day) {
            if birthdayComparison == .orderedSame {
            print("Happy Birthday!")
            }
        }
    }
}

class AreaAccessKiosk: Kiosk {
    let description = "AreaAccessKiosk"
    var areaBeingAuthorized: AreaAccess
    
    init(for areaBeingAuthorized: AreaAccess, with pass: Pass) {
        self.areaBeingAuthorized = areaBeingAuthorized
        super.init(pass: pass)
    }
    
    override func swipe() {
        
        var catagoricalPermissions = 0 // Used to relay whether or not an entrant has no permissions in a situation
        
        do{
            for permission in try pass.getAccessPrivileges() {
                switch permission {
                case .areaAccess(areaBeingAuthorized) :
                    switch areaBeingAuthorized {
                    case .amusement, .kitchen, .maintenance, .office, .rideControl:
                        print("Access authorized")
                        catagoricalPermissions += 1
                    }
                default:
                    continue
                }
            }
        
            if catagoricalPermissions == 0 {
                print("Access Denied")
            }
            printBirthdayMessage()
            
        } catch InfoError.missingInformation(let object, let description) {
            print("Error in \(String(describing: object)): \(description)")
        } catch InfoError.invalidBirthday(let object, let description) {
            print("Invalid birthday set in \(String(describing: object)): \(description)")
        } catch {
            print("Uncaught error in pass.getAccesspriveleges()")
        }
    }
    
}


class RideAccessKiosk: Kiosk {
    
    let description = "RideAccessKiosk"
    var rideBeingAuthorized: RideAccess
    
    init(for rideBeingAuthorized: RideAccess, with pass: Pass) {
        self.rideBeingAuthorized = rideBeingAuthorized
        super.init(pass: pass)
    }
    
    override func swipe() {
        do {
            for permission in try pass.getAccessPrivileges() {
                switch permission {
                case .rideAccess(rideBeingAuthorized) :
                    switch rideBeingAuthorized {
                    case .allRides:
                        print("Ride access granted!")
                    
                    case .noRides:
                        print("Ride access denied.")
                    }
                case .ridePriority(let linePriority):
                    switch linePriority {
                    case .standard:
                        print("Please enter at the end of the line.")
                    case .skipPrivilege:
                    print("Please proceed to the end of the line.")
                }
                default:
                    continue
                }
            }
            
            printBirthdayMessage()
            
        }  catch InfoError.missingInformation(let object, let description) {
            print("Error in \(String(describing:object)): \(description)")
        } catch InfoError.invalidBirthday(let object, let description) {
            print("Invalid birthday set in \(String(describing:object)): \(description)")
        } catch {
            print("Uncaught error in pass.getAccesspriveleges()")
        }
    
    }
}

class VendorStallKiosk: Kiosk {
    
    let description = "VendorStallKiosk"
    
    var discountBeingAuthorized: Discount
        
    init(for discountBeingAuthorized: Discount, with pass: Pass) {
        self.discountBeingAuthorized = discountBeingAuthorized
        super.init(pass: pass)
    }
        
    override func swipe() {
        var catagoricalPermissions = 0
        do {
            for permission in try pass.getAccessPrivileges() {
                switch permission {
                case .discountAccess(discountBeingAuthorized, let discountAmount) :
                    switch discountBeingAuthorized {
                    case .food, .merchandise:
                        print("Please provide discount of \(discountAmount).")
                        catagoricalPermissions += 1
                    }
                default:
                    continue
                }
            }
            
            printBirthdayMessage()
            
        }  catch InfoError.missingInformation(let object, let description) {
            print("Error in \(String(describing:object)): \(description)")
        } catch InfoError.invalidBirthday(let object, let description) {
            print("Invalid birthday set in \(String(describing:object)): \(description)")
        } catch {
            print("Uncaught error in pass.getAccesspriveleges()")
        }
            
        if catagoricalPermissions == 0 {
            print("No discount")
        }
    }
}





















































