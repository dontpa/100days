import Cocoa

var greeting = "Hello, playground"
var bratles = ["john","paul"]
var numbers = [1,2,3,4]
var doub = [1,2.3,4]

bratles.append("anothername")
print(bratles)
doub.append(33)

var scores = Array<Int>()
scores.append(100)
print(scores)

var initstr = [String]()
print(initstr.count)

let week = ["Monday","Tuesday"]

let employee2 = [
    "name": "Taylor Swift",
    "job": "Singer",
    "location": "Nashville"
]

print(employee2["name",default: "Unknown"])
print(employee2["nonekey",default: "Unknown"])

var heights = [String:Int]()
heights["Yao"] = 333
heights["ano"] = 3

let people = Set(["Denzel Washington", "Tom Cruise", "Nicolas Cage", "Samuel L Jackson"])
print(people)
var people2 = Set<String>()
people2.insert("Taylor Swift")
people2.insert("Taylor Swift")
print(people2)

enum Weekday {
    case monday
    case tuesday
    case wednesday
    case thursday
    case friday
}

var day = Weekday.monday
day = .friday

