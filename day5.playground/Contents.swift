import Cocoa

var greeting = "Hello, playground"

let score = 85
if score > 80 {
    print("Great job")
}

var numbers = [1,2,3]
numbers.append(4)
if numbers.count > 3{
    numbers.remove(at: 0)
}

print(numbers)

var username = "Taylor"
if username.isEmpty {
    username = "Anonymous"
}
print("Welcome, \(username)")

var doub :Double = 22000
var intn = 22000

enum Weather  {
    case sun, rain, wind, snow, unknown
}

let forecast = Weather.rain
switch forecast{
case .sun:
    print("sun")
case .rain:
    print("rain")
case .wind:
    print("wind")
case .snow:
    print("snow")
case .unknown:
    print("unknown")
}

let strswitch = "strswitch"
switch strswitch{
case "strswitch":
    print(strswitch)
default:
    print("default")
}

let day = 5
print("My true love gave to me…")

switch day {
case 5:
    print("5 golden rings")
    fallthrough
case 4:
    print("4 calling birds")
case 3:
    print("3 French hens")
case 2:
    print("2 turtle doves")
default:
    print("A partridge in a pear tree")
}
