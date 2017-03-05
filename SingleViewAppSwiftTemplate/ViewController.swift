//
//  ViewController.swift
//  SingleViewAppSwiftTemplate
//
//  Created by Treehouse on 12/8/16.
//  Copyright © 2016 Treehouse. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func swipe(for entrant: Entrant, accessTo: Access) {
        
        switch accessTo {
        case .amusement :
            if entrant.canEnterAmusementAreas == true {
                print("Access Granted")
            } else {
                print("Access Denied")
            }
        case .kitchen:
            if entrant.canEnterKitchenAreas == true {
                print("Access Granted")
            } else {
                print("Access Denied")
            }
        case .rideControl:
            if entrant.canEnterRideControlAreas == true {
                print("Access Granted")
            } else {
                print("Access Denied")
            }
        case .maintenance:
            if entrant.canEnterMaintenanceAreas == true {
                print("Access Granted")
            } else {
                print("Access Denied")
            }
        case .office:
            if entrant.canEnterOfficeArea == true {
                print("Access Granted")
            } else {
                print("Access Denied")
            }
        case .allRidesAccess:
            if entrant.canAccessAllRides == true {
                print("Approved")
            } else {
                print("Denied")
            }
        case .skipPrivilage:
            if entrant.canSkipRideLines == true {
                print("Please proceed to the front of the line.")
            } else {
                print("Please proceed to the end of the line.")
            }
        }
        
        
        
        if let birthdayCheck = entrant.birthday,
            entrant.calendar.compare(birthdayCheck,
                                     to: Date(),
                                     toGranularity: .day) == .orderedSame {
            print("Happy Birthday!")
        }
        
        
        
    }
}

