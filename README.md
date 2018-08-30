## SegueAddition
Easily way to write perfromSegue(withIdentifier:sender).

## Usage
You can call `performSegue` with closure.

```swift
let customString = "CustomString"
performSegue("SegueIdentfiier") { segue in
  guard let toViewController = segue.destinationViewController as? CustomViewController else {
    fatalError()
  }
  toViewController.string = customString
}
```

It has the same meaning.
```swift
...
let customString = "CustomString"
performSegueWithIdentifier("SegueIdentfiier", sender: customString)
...

override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
  guard let toViewController = segue.destinationViewController as? CustomViewController,
            customString = sender as? String
        where segue.identifier == "SegueIdentfiier"
        else {
            fatalError()
        }
        toViewController.string = customString
}
```

So, no need to write `prepare(for segue: UIStoryboardSegue, sender: Any?)` again.
And, It is read and write easy for perform segue event and passing value to next view controller.

## LICENSE
[SegueAddition](https://github.com/bannzai/SegueAddition) is released under the MIT license. See LICENSE for details.
