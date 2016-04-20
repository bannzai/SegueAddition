
## SegueAddition
Easily way to write perfromSegueWithIdentifier.

## Usage
You can use `performSegue` in UIViewController subclass.  
`performSegue` work similar for `performSegueWithIdentifier`.  
But, `performSegue` is cooler compared with using `performSegueWithIdentifier`.

```swift
performSegue("SegueIdentfiier") { segue in
  guard let toViewController = segue.destinationViewController else {
    fatalError()
  }
  toViewController.title = "title"
}
```

If you use `performSegue`, it isn't necessary to write `override func prepareForSegue` method.
Because you can write closure in `performSegue`, what done on `prepareForSegue`!

[SegueAddition](git@github.com:bannzai/SegueAddition.git) is released under the MIT license. See LICENSE for details.
