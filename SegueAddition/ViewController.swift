//
//  ViewController.swift
//  SegueAddition
//
//  Created by kingkong999yhirose on 2016/04/18.
//  Copyright © 2016年 kingkong999yhirose. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
}

class CycleReferenceCheckViewController: UIViewController {
    var string = ""
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        guard let identifier = segue.identifier else {
            return
        }
        
        // Manual
        guard identifier == "StandardSegue" else {
            fatalError()
        }
        
    }
    
    @IBAction func standardSegue(_ sender: AnyObject) {
        self.performSegue(withIdentifier: "StandardSegue", sender: nil)
    }

    @IBAction func useSegueClosure(_ sender: AnyObject) {
        string = #function
        performSegue("UseSegueClosure") { segue in
            guard let viewController = segue.destination
                as? ManualSegueUseSegueClosureViewController
                else {
                    fatalError()
            }
            viewController.printer = self.string // Check Cycle Reference
            viewController.view.backgroundColor = UIColor.yellow
        }
    }
    deinit {
        print(#function)
    }
}

class SegueSettingStoryboardViewController: UIViewController {
    deinit {
        print(#function)
    }
}

class ManualSegueUseSegueClosureViewController: UIViewController {
    var printer: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(printer)
    }
    deinit {
        print(#function)
    }
}

class ManualSegueUseStandardViewController: UIViewController {
    deinit {
        print(#function)
    }
}

