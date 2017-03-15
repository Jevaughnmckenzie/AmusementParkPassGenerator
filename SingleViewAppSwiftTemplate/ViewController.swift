//
//  ViewController.swift
//  SingleViewAppSwiftTemplate
//
//  Created by Treehouse on 12/8/16.
//  Copyright © 2016 Treehouse. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // Test Case used to show kiosk ability to stop a double swipe
//    let employee4 = EntrantType.employee(.rideService)
//    let employee4PersonalInfo = EntrantInfo(firstName: "Jevaughn", lastName: "McKenzie", birthday: nil, streetAddress: "81 Linden Street", city: "Ft. Lauderdale", state: "NY", zipcode: "33313")
//    var employee4Pass: Pass!
//    var areaAccessTest7: AreaAccessKiosk!
//    var rideAccessTest7: RideAccessKiosk!
//    var discountTest7: VendorStallKiosk!
//    var doubleSwipeTimer: Timer!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    //MARK: helper methods test out double swipe functionality
//        loadInfo()
//        swipeTest()
//        verifyDoubleSwipeCheckWorks()
        
        testCases()
    }


// MARK: Test Cases
    func testCases() {
        
//        let guest1 = EntrantType.guest(.regularGuest)
//        let guest1PersonalInfo = EntrantInfo(firstName: "Jevaughn", lastName: "McKenzie", birthday: nil, streetAddress: "81 Linden St.", city: "Malvenre", state: "NY", zipcode: "11565")
//        let guest1Pass = Pass(entrant: guest1, personalInfo: guest1PersonalInfo)
//        let rideAccessTest1 = RideAccessKiosk(for: .allRides, with: guest1Pass)
//        let areaAccessTest1 = AreaAccessKiosk(for: .amusement, with: guest1Pass)
//        let discountTest1 = VendorStallKiosk(for: .food, with: guest1Pass)
//        rideAccessTest1.doubleSwipeCheck()
//        areaAccessTest1.doubleSwipeCheck()
//        discountTest1.doubleSwipeCheck()
//        
//        
//        let guest2 = EntrantType.guest(.vip)
//        let guest2PersonalInfo = EntrantInfo(firstName: "Lulu", lastName: "Maya", birthday: "03/14/1967", streetAddress: nil, city: nil, state: nil, zipcode: nil)
//        let guest2Pass = Pass(entrant: guest2, personalInfo: guest2PersonalInfo)
//        let discountTest2 = VendorStallKiosk(for: .merchandise, with: guest2Pass)
//        let areaAccessTest2 = AreaAccessKiosk(for: .rideControl, with: guest2Pass)
//        discountTest2.doubleSwipeCheck()
//        areaAccessTest2.doubleSwipeCheck()
//        
//        let guest3 = EntrantType.guest(.child)
//        let guest3PersonalInfo = EntrantInfo(firstName: nil, lastName: nil, birthday: "03/14/2015", streetAddress: nil, city: nil, state: nil, zipcode: nil)
//        let guest3Pass = Pass(entrant: guest3, personalInfo: guest3PersonalInfo)
//        let discountTest3 = VendorStallKiosk(for: .merchandise, with: guest3Pass)
//        let areaAccessTest3 = AreaAccessKiosk(for: .amusement, with: guest3Pass)
//        discountTest3.doubleSwipeCheck()
//        areaAccessTest3.doubleSwipeCheck()
//        
//        let employee1 = EntrantType.employee(.manager)
//        let employee1PersonalInfo = EntrantInfo(firstName: "Eric", lastName: "Wong", birthday: nil, streetAddress: "81", city: "Malverne", state: "NY", zipcode: "10101")
//        let employee1Pass = Pass(entrant: employee1, personalInfo: employee1PersonalInfo)
//        let areaAccessTest4 = AreaAccessKiosk(for: .kitchen, with: employee1Pass)
//        let discountTest4 = VendorStallKiosk(for: .food, with: employee1Pass)
//        areaAccessTest4.doubleSwipeCheck()
//        discountTest4.doubleSwipeCheck()
//        
//        let employee2 = EntrantType.employee(.foodService)
//        let employee2PersonalInfo = EntrantInfo(firstName: "Tank", lastName: "Marcus", birthday: nil, streetAddress: "32 Water St.", city: "Lauderhill", state: "FL", zipcode: "11454")
//        let employee2Pass = Pass(entrant: employee2, personalInfo: employee2PersonalInfo)
//        let areaAccessTest5 = AreaAccessKiosk(for: .kitchen, with: employee2Pass)
//        let discountTest5 = VendorStallKiosk(for: .food, with: employee2Pass)
//        areaAccessTest5.doubleSwipeCheck()
//        discountTest5.doubleSwipeCheck()
//        
//        let employee3 = EntrantType.employee(.maintenance)
//        let employee3PersonalInfo = EntrantInfo(firstName: "Jordan", lastName: "Morris", birthday: nil, streetAddress: "81 Linden St.", city: "Malverne", state: "NY", zipcode: "11565")
//        let employee3Pass = Pass(entrant: employee3, personalInfo: employee3PersonalInfo)
//        let areaAccessTest6 = AreaAccessKiosk(for: .maintenance, with: employee3Pass)
//        let rideAccessTest6 = RideAccessKiosk(for: .allRides, with: employee3Pass)
//        let discountTest6 = VendorStallKiosk(for: .food, with: employee3Pass)
//        areaAccessTest6.doubleSwipeCheck()
//        rideAccessTest6.doubleSwipeCheck()
//        discountTest6.doubleSwipeCheck()
        
        
//*************************** Error Cases ***************************
//        let guest4 = EntrantType.guest(.child)
//        let guest4PersonalInfo = EntrantInfo(firstName: nil, lastName: nil, birthday: nil, streetAddress: nil, city: nil, state: nil, zipcode: nil)
//        let guest4Pass = Pass(entrant: guest4, personalInfo: guest4PersonalInfo)
//        let discountTest8 = VendorStallKiosk(for: .merchandise, with: guest4Pass)
//        let areaAccessTest8 = AreaAccessKiosk(for: .amusement, with: guest4Pass)
//        let rideAccessTest8 = RideAccessKiosk(for: .allRides, with: guest4Pass)
//        areaAccessTest8.doubleSwipeCheck()
//        rideAccessTest8.doubleSwipeCheck()
//        discountTest8.doubleSwipeCheck()
//        
//        
//        let employee5 = EntrantType.employee(.manager)
//        let employee5PersonalInfo = EntrantInfo(firstName: "Eric", lastName: "Wong", birthday: nil, streetAddress: "81", city: nil, state: "NY", zipcode: "01002")
//        let employee5Pass = Pass(entrant: employee5, personalInfo: employee5PersonalInfo)
//        let areaAccessTest9 = AreaAccessKiosk(for: .kitchen, with: employee5Pass)
//        let discountTest9 = VendorStallKiosk(for: .food, with: employee5Pass)
//        areaAccessTest9.doubleSwipeCheck()
//        discountTest9.doubleSwipeCheck()

        
        
    }
    
    

//MARK: Helper Methods called in viewDidLoad()
//    func loadInfo() {
//        employee4Pass = Pass(entrant: employee4, personalInfo: employee4PersonalInfo)
//        areaAccessTest7 = AreaAccessKiosk(for: .rideControl, with: employee4Pass)
//        rideAccessTest7 = RideAccessKiosk(for: .allRides, with: employee4Pass)
//        discountTest7 = VendorStallKiosk(for: .merchandise, with: employee4Pass)
//    
//    }
//
//    func swipeTest() {
//       areaAccessTest7.doubleSwipeCheck()
//        
//    }
//    
//    func verifyDoubleSwipeCheckWorks(){
//            doubleSwipeTimer = Timer.scheduledTimer(timeInterval: 5.0, target: self, selector: #selector(swipeTest), userInfo: nil, repeats: false)
//        }
    


    
    

}

