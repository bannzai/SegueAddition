//
//  SegueAddition.swift
//  SegueAddition
//
//  Created by kingkong999yhirose on 2016/04/18.
//  Copyright © 2016年 kingkong999yhirose. All rights reserved.
//

import UIKit


private class SegueEventHolder {
    let segueClosure:((UIStoryboardSegue) -> Void)?
    
    init(segueClosure: ((UIStoryboardSegue) -> Void)?) {
        self.segueClosure = segueClosure
    }
}


public extension UIViewController {
    fileprivate func swizzling() {
        let prepareForSegue = class_getInstanceMethod(type(of: self), #selector(UIViewController.prepare))
        let receiveSegue = class_getInstanceMethod(type(of: self), #selector(UIViewController.receiveSegue(_:sender:)))
        method_exchangeImplementations(prepareForSegue!, receiveSegue!)
    }
    
    public func performSegue(_ withIdentifier: String, closure: ((UIStoryboardSegue) -> Void)? = nil) {
        swizzling()
        self.performSegue(withIdentifier: withIdentifier, sender: SegueEventHolder(segueClosure: closure))
        swizzling()
    }
    
    @objc final func receiveSegue(_ segue: UIStoryboardSegue, sender: AnyObject?) {
        let event = sender as! SegueEventHolder
        event.segueClosure?(segue)
    }
}

