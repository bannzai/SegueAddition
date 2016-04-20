//
//  SegueAddition.swift
//  SegueAddition
//
//  Created by kingkong999yhirose on 2016/04/18.
//  Copyright © 2016年 kingkong999yhirose. All rights reserved.
//

import UIKit


private class SegueEventHolder {
    let segueClosure:(UIStoryboardSegue -> Void)?
    
    init(segueClosure: (UIStoryboardSegue -> Void)?) {
        self.segueClosure = segueClosure
    }
}


public extension UIViewController {
    private func swizzling() {
        let prepareForSegue = class_getInstanceMethod(self.dynamicType, #selector(UIViewController.prepareForSegue(_:sender:)))
        let receiveSegue = class_getInstanceMethod(self.dynamicType, #selector(UIViewController.receiveSegue(_:sender:)))
        method_exchangeImplementations(prepareForSegue, receiveSegue)
    }
    
    public func performSegue(withIdentifier: String, closure: (UIStoryboardSegue -> Void)? = nil) {
        swizzling()
        performSegueWithIdentifier(withIdentifier, sender: SegueEventHolder(segueClosure: closure))
        swizzling()
    }
    
    final func receiveSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let event = sender as! SegueEventHolder
        event.segueClosure?(segue)
    }
}

