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
        let _prepare = class_getInstanceMethod(type(of: self), #selector(UIViewController._prepare(segue:sender:)))
        method_exchangeImplementations(prepareForSegue!, _prepare!)
    }
    
    public func performSegue(_ withIdentifier: String, closure: ((UIStoryboardSegue) -> Void)? = nil) {
        swizzling()
        self.performSegue(withIdentifier: withIdentifier, sender: SegueEventHolder(segueClosure: closure))
        swizzling()
    }
    
    @objc final func _prepare(segue: UIStoryboardSegue, sender: AnyObject?) {
        let event = sender as! SegueEventHolder
        event.segueClosure?(segue)
    }
}

