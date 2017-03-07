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
        
        let isAuthorized = AuthorizationSwipe(entrant: <#T##EntrantType#>)
        
        let worker = FoodServiceWorker(firstName: "Jevaughn",
                                       lastName: "McKenzie",
                                       fullAddress: FullAddress(streetAddress: "81 Linden St.",
                                                                city: "Malverne",
                                                                state: "NY",
                                                                zipcode: "11565"))
        
        let entrant = EntrantType.employee(EmployeeType.foodService(worker))
        
        let name = entrant.firstName
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

            
        
        
        
        
        
        
    }
}

