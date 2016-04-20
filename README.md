
## SegueAddition
Easily way to write perfromSegueWithIdentifier.

## Usage
You can use `performSegue(withIdentifier:closure)`  in UIViewController subclass.  
`performSegue(withIdentifier:closure)` work similar for `performSegueWithIdentifier(identifier:sender)`  
But, use `performSegue(withIdentifier:closure)` is very smart.

```swift
performSegue("SegueIdentfiier") { sengue in
  guard let toViewController = segue.destinationViewController else {
    fatalError()
  }
  toViewController.title = "title"
}
```

So, you have not to write `prepareForSegue(segue:sender)`.
