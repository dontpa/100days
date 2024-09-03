import Cocoa

var greeting = "Hello, playground"
let sayHello = { (name:String) -> String in
    "Hi there \(name)"
}
sayHello("swift")

func greetUser() {
    print("Hi there!")
}

var greetCopy:()->Void = greetUser

let team = ["Gloria", "Suzanne", "Piper", "Tiffany"]
let captainFirstTeam = team.sorted{
    if $0 == "Suzanne" {
        return true
    } else if $1 == "Suzanne" {
        return false
    }
    return $0 < $1
}

print(captainFirstTeam)

var cutGrass = { (currentLength: Double) in
    switch currentLength {
    case 0...1:
        print("That's too short")
    case 1...3:
        print("It's already the right length")
    default:
        print("That's perfect.")
    }
}

func makeArray(size:Int, using generator:()->Int) -> [Int] {
    var numbers = [Int]()
    
    for _ in 0..<size{
        let generated = generator()
        numbers.append(generated)
    }
    return numbers
}

let rolls = makeArray(size: 50){
    Int.random(in: 1...20)
}
print(rolls)

func tendGarden(activities: () -> Void) {
    print("I love gardening")
    activities()
}
tendGarden {
    print("Let's grow some roses!")
}

func goCamping(then action: () -> Void) {
    print("We're going camping!")
    action()
}
goCamping {
    print("Sing songs")
    print("Put up tent")
    print("Attempt to sleep")
}

// checkpoint 5
let luckyNumbers = [7, 4, 38, 21, 16, 15, 12, 33, 31, 49]
let result = luckyNumbers.sorted().filter{$0 % 2 != 0}.map{"\($0) is a lucky number"}
print(result)
