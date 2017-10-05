//
//  cycleRetain.swift
//  retainCycle
//
//  Created by Emmanuel Idehen on 10/5/17.
//  Copyright © 2017 Emmanuel Idehen. All rights reserved.
//

import UIKit

class cycleRetain: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    class Person {
        let name: String
        var apartment: Apartment?
        init(name: String) {
            self.name = name
        }
        
        deinit {
            print("\(name) is being deinitialized")
        }
    }
    
    class Apartment {
        
        let number: Int
        weak var tenant: Person?
        
        init(number: Int) {
            self.number = number
        }
        
        deinit {
            print("Apartment \(number) is being deinitialized")
        }
    }
    
    var bob: Person? = Person(name: "Bob")
    var apt: Apartment? = Apartment(number: 123)
    
    
    apt?.tenant = bob
    bob?.apartment = apt
    
    bob = nil
    apt = nil
    
    
}
