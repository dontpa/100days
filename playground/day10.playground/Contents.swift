import Cocoa

var greeting = "Hello, playground"

struct Album{
    let title:String
    let artist:String
    let year:Int
    
}

struct Diary {
    var entries: String
    mutating func add(entry: String) {
        entries += "\(entry)"
    }
}

struct Employee {
    let name: String
    var vacationAllocated: Int
    var vacationTaken: Int = 0
    
    var vacationRemaining:Int {
        get{
            vacationAllocated - vacationTaken
        }
        
        set {
            vacationAllocated = vacationTaken + newValue
        }
    }
}

var archer = Employee(name: "Sterling Archer", vacationAllocated: 14)
archer.vacationTaken += 4
print(archer.vacationRemaining)
archer.vacationRemaining = 5
print(archer.vacationAllocated)


struct Game {
    var score = 0 {
        didSet {
            print("The old value is \(oldValue)")
            print("Score is now \(score)")
        }
        
        willSet{
            print("the willset value is \(score)")
            print("it will be changed to \(newValue)")
        }
    }
}

var game = Game()
game.score += 10

game.score -= 3

game.score += 1

struct Player {
    let name: String
    let number: Int
    
    init(name: String, number: Int) {
        self.name = name
        self.number = number
    }
}

let player = Player(name: "Megan R", number: 15)

struct Language {
    var nameEnglish: String
    var nameLocal: String
    var speakerCount: Int
    init(english: String, local: String, speakerCount: Int) {
        self.nameEnglish = english
        self.nameLocal = local
        self.speakerCount = speakerCount
    }
}
let french = Language(english: "French", local: "français", speakerCount: 220_000_000)
