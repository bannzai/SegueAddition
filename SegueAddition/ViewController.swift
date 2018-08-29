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
        
        if identifier != "StandardSegue" {
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
            viewController.debugString = self.string // Check Cycle Reference
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
    var debugString: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if debugString == nil {
            fatalError()
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

