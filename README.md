
## SegueAddition
Easily way to write perfromSegueWithIdentifier.

## Usage
You can use `performSegue` in UIViewController subclass.  
`performSegue` work similar for `performSegueWithIdentifier`.  
But, `performSegue` is cooler compared with using `performSegueWithIdentifier`.


```swift
let customString = "CustomString"
performSegue("SegueIdentfiier") { segue in
  guard let toViewController = segue.destinationViewController as? CustomViewController else {
    fatalError()
  }
  toViewController.string = customString
}
```

same this

```swift
...
let customString = "CustomString"
performSegueWithIdentifier("SegueIdentfiier", sender: customString)
...

override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
  guard let toViewController = segue.destinationViewController as? CustomViewController,
            customString = sender as? String
        where segue.identifier == "SegueIdentfiier"
        else {
            fatalError()
        }
        toViewController.string = customString
}
```

If you use `performSegue`, it isn't necessary to write `override func prepareForSegue` method.
Because you can write closure in `performSegue`, what done on `prepareForSegue`!

```swift
override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    fatalError("Do not call")    
}
```

Couldn't call `prepareForSegue` passed `performSegueWithIdentifier`?
No, it's possible to use `performSegueWithIdentifier` method same way.

```swift
override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    print("Call this one") // Print in console "Call this one"
}

...
performSegueWithIdentifier("SegueIdentifier", sender: nil)
...
```

Only to use `performSegue` case, that not call `prepareForSegue`.

## LICENSE
[SegueAddition](https://github.com/bannzai/SegueAddition) is released under the MIT license. See LICENSE for details.
