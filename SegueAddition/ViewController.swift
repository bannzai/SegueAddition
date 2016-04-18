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
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        guard let identifier = segue.identifier else {
            return
        }
        
        // Manual
        guard identifier == "StandardSegue" else {
            return
        }
        
    }
    
    @IBAction func standardSegue(sender: AnyObject) {
        performSegueWithIdentifier("StandardSegue", sender: nil)
    }

    @IBAction func useSegueClosure(sender: AnyObject) {
        string = #function
        performSegue("UseSegueClosure") { segue in
            guard let viewController = segue.destinationViewController
                as? ManualSegueUseSegueClosureViewController
                else {
                    fatalError()
            }
            viewController.printer = self.string // Check Cycle Reference
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
    var printer: String? {
        didSet {
            print(printer)
        }
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

