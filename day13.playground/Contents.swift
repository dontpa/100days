import Cocoa

var greeting = "Hello, playground"

protocol Vehicle {
    var name: String { get }
    var currentPassengers: Int { get set }
    func estimateTime(for distance: Int) -> Int
    func travel(distance: Int)
}

struct Car: Vehicle {
    var name: String = "Car"
    var currentPassengers: Int = 4
    func estimateTime(for distance: Int) -> Int {
        distance / 50
    }

    func travel(distance: Int) {
        print("I'm driving \(distance)km.")
    }

    func openSunroof() {
        print("It's a nice day!")
    }
}

var b :Bool = true

func getRandomNumber() -> some Equatable {
    Int.random(in: 1...6)
}

func getRandomBool() -> any Equatable {
    Bool.random()
}
print(getRandomNumber() == getRandomNumber())

var quote = "   The truth is rarely pure and never simple   "
print(quote)
let trimmed = quote.trimmingCharacters(in: .whitespacesAndNewlines)
print(trimmed)



extension String {
    func trimmed() -> String{
        self.trimmingCharacters(in: .whitespacesAndNewlines)
    }
    
    mutating func trim(){
        self = self.trimmed()
    }
    
    var lines: [String] {
        self.components(separatedBy: .newlines)
    }
}
let newTrimmed = quote.trimmed()
quote.trim()
print(quote)
// the guideline of swift, if you are returning a new value rather than changing it in place,
// you should use word endings like ed or ing, like reversed()
// or if you use a verb like sort(), you will sort the array in place rather than returning a new copy.

let lyrics = """
But I keep cruising
Can't stop, won't stop moving
It's like I got this music in my mind
Saying it's gonna be alright
"""

print(lyrics.lines)

struct Book {
    let title: String
    let pageCount: Int
    let readingHours: Int
}

let lotr = Book(title: "Lord of the Rings", pageCount: 1178, readingHours: 24)

extension Book {
    init(title:String, pageCount:Int){
        self.title = title
        self.pageCount = pageCount
        self.readingHours = pageCount / 50
    }
}

extension Collection {
    var isNotEmpty: Bool {
        isEmpty == false
    }
}
let guests = ["Mario", "Luigi", "Peach"]

if guests.isNotEmpty {
    print("array not empty")
}

protocol Person {
    var name: String { get }
    func sayHello()
}

extension Person {
    func sayHello() {
        print("Hi, I'm \(name)")
    }
}

struct Employee: Person {
    let name: String
}
let numbers3 = ["four": 4, "eight": 8, "fifteen": 15, "sixteen": 16]
let allEven3 = numbers3.allSatisfy { $0.value.isMultiple(of: 2) }


// checkpoint 8
protocol Building{
    var roomNums : Int {get}
    var cost : Int{get set}
    var agency : String{get set}
    func summary()
}

extension Building{
    func summary(){
        print("this building cost \(cost) and it has \(roomNums) rooms, sold by \(agency)")
    }
}

struct House : Building{
    let roomNums: Int
    var cost: Int
    var agency: String
}

struct Office : Building{
    let roomNums: Int
    var cost: Int
    var agency: String
}
