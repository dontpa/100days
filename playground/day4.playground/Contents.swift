import Cocoa

var greeting = "Hello, playground"

// empty string array
var teams :[String] = [String]()
// use type inference
var clues = [String]()

enum UIStyle {
    case light, dark,system
}

var style = UIStyle.light

let username :String
username = "@tt"
print(username)

// checkpoint 2
let arrayStr :[String] = ["item01","item02","item02","item03","item04"]
print(arrayStr.count)
let arrayStrSet = Set(arrayStr)
print(arrayStrSet.count)
