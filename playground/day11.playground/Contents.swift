import Cocoa

var greeting = "Hello, playground"

struct BankAccount {
    private(set) var fund = 0
    
    init(amount:Int){
        self.fund = amount
    }
    mutating func deposit(amount:Int){
        fund += amount
    }
    
    mutating func withdraw(amount:Int) -> Bool {
        if fund > amount {
            fund = fund - amount
            return true
        } else {
            return false
        }
    }
    
    
}

var account = BankAccount(amount:100)

print(account.fund)
print(account.withdraw(amount: 10))

struct App {
    var name: String
    private var sales = 0
    init(name: String) {
        self.name = name
    }
}
let spotify = App(name: "Spotify")

struct Contributor {
    private var name = "Anonymous"
}
let paul = Contributor()
print(paul)

struct Doctor {
    var name: String
    var location: String
    private var currentPatient = "No one"
}
//let drJones = Doctor(name: "Esther Jones", location: "Bristol")

struct Tester{
    static var num = 100
}
print(Tester.num)
Tester.num+=100
print(Tester.num)

// checkpoint 6
struct Car {
    let model : String
    let numberOfSeats : Int
    private(set) var currentGear: Int
    
    mutating func shiftGear(to newGear : Int){
        self.currentGear = newGear
    }
    
    // a initializer is not needed because the currentGear can be accessed within the struct,
    // so the memberwise initializer could know that property, which is legal
}

var car = Car(model: "Model S", numberOfSeats: 4, currentGear: 3)
print(car)
