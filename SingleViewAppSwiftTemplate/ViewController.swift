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
        
        testCases()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

// MARK: Test Cases
    
    
    
    func testCases() {
//        let guest1 = EntrantType.guest(.regularGuest)
//        let guest1PersonalInfo = EntrantInfo(firstName: "Jevaughn", lastName: "McKenzie", birthday: nil, streetAddress: "81 Linden St.", city: "Malvenre", state: "NY", zipcode: "11565")
//        let guest1Pass = Pass(entrant: guest1, personalInfo: guest1PersonalInfo)
//        let rideAccessTest1 = RideAccessKiosk(for: .allRides, with: guest1Pass)
//        let areaAccessTest1 = AreaAccessKiosk(for: .amusement, with: guest1Pass)
//        let discountTest1 = VendorStallKiosk(for: .food, with: guest1Pass)
//        //FIXME: find a way to call swip() instead of doubleSwipeCheck() and create the same effect
//        rideAccessTest1.doubleSwipeCheck()
//        areaAccessTest1.doubleSwipeCheck()
//        discountTest1.doubleSwipeCheck()
//
//        
//        let guest2 = EntrantType.guest(.vip)
//        let guest2PersonalInfo = EntrantInfo(firstName: "Lulu", lastName: "Maya", birthday: nil, streetAddress: nil, city: nil, state: nil, zipcode: nil)
//        let guest2Pass = Pass(entrant: guest2, personalInfo: guest2PersonalInfo)
//        let discountTest2 = VendorStallKiosk(for: .merchandise, with: guest2Pass)
//        let areaAccessTest2 = AreaAccessKiosk(for: .rideControl, with: guest2Pass)
//        
//        discountTest2.doubleSwipeCheck()
//        areaAccessTest2.doubleSwipeCheck()
//        
//        let guest3 = EntrantType.guest(.child)
//        let guest3PersonalInfo = EntrantInfo(firstName: nil, lastName: nil, birthday: "03/28/1995", streetAddress: nil, city: nil, state: nil, zipcode: nil)
//        let guest3Pass = Pass(entrant: guest3, personalInfo: guest3PersonalInfo)
//        let discountTest3 = VendorStallKiosk(for: .merchandi se, with: guest3Pass)
//        let areaAccessTest3 = AreaAccessKiosk(for: .amusement, with: guest3Pass)
//        
//        discountTest3.doubleSwipeCheck()
//        areaAccessTest3.doubleSwipeCheck()
        
//        let employee1 = EntrantType.employee(.manager)
//        let employee1PersonalInfo = EntrantInfo(firstName: "Eric", lastName: "Wong", birthday: nil, streetAddress: "81", city: "Malverne", state: "NY", zipcode: "#4")
//        let employee1Pass = Pass(entrant: employee1, personalInfo: employee1PersonalInfo)
//        let areaAccessTest4 = AreaAccessKiosk(for: .kitchen, with: employee1Pass)
//        let discountTest4 = VendorStallKiosk(for: .food, with: employee1Pass)
//        
//        areaAccessTest4.doubleSwipeCheck()
//        discountTest4.doubleSwipeCheck()
        
        let employee2 = EntrantType.employee(.foodService)
        let employee2PersonalInfo = EntrantInfo(firstName: "Tank", lastName: nil, birthday: nil, streetAddress: "32 Water St.", city: "Lauderhill", state: "FL", zipcode: "11454")
        let employee2Pass = Pass(entrant: employee2, personalInfo: employee2PersonalInfo)
        let areaAccessTest5 = AreaAccessKiosk(for: .kitchen, with: employee2Pass)
        let discountTest5 = VendorStallKiosk(for: .food, with: employee2Pass)
        
       
        areaAccessTest5.doubleSwipeCheck()
        discountTest5.doubleSwipeCheck()
        
        
        // Error checking
        

    }
    
    

}

