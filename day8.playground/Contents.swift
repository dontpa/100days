import Cocoa

var greeting = "Hello, playground"

enum PasswordError:Error{
    case short,obvious
}

func checkPassword(_ password:String) throws ->String{
    if password.count < 5{
        throw PasswordError.short
    }
    if password == "12345"{
        throw PasswordError.obvious
    }
    
    if password.count < 8{
        return "OK"
    } else if password.count < 10 {
        return "Good"
    } else {
        return "Excellent"
    }
    
}

let string = "12345"
do {
    let result = try checkPassword(string)
    print("Password rating: \(result)")
} catch PasswordError.short {
    print("short error")
} catch PasswordError.obvious {
    print("obvious error")
} catch {
    print("There was an error.")
}


// checkpoint 4
enum FindRootError : Error{
    case outOfBounds, noRoot
}
func findRoot(_ number : Int) throws -> Int {
    if number < 1 || number > 10000 {
        throw FindRootError.outOfBounds
    }
    for i in 1...100 {
        if i * i == number {
            return i
        }
    }
    throw FindRootError.noRoot
}

let a = 25
let b = 30
let c = -1
let d = 10000
do {
//    print(try findRoot(a))
//    print(try findRoot(b))
//    print(try findRoot(c))
    print(try findRoot(d))
} catch FindRootError.noRoot {
    print("no root error")
} catch FindRootError.outOfBounds {
    print("out of bounds error")
}

// answer given by chatgpt
enum SquareRootError: Error {
    case outOfBounds
    case noRoot
}

func integerSquareRoot(of number: Int) throws -> Int {
    // Check if the number is within the acceptable range
    guard number >= 1 && number <= 10_000 else {
        throw SquareRootError.outOfBounds
    }
    
    // Perform a binary search to find the integer square root
    var low = 1
    var high = number
    
    while low <= high {
        let mid = (low + high) / 2
        let midSquared = mid * mid
        
        if midSquared == number {
            return mid
        } else if midSquared < number {
            low = mid + 1
        } else {
            high = mid - 1
        }
    }
    
    // If no integer square root was found, throw an error
    throw SquareRootError.noRoot
}

// Example usage
do {
    let result = try integerSquareRoot(of: 30)
    print("The integer square root is \(result)")
} catch SquareRootError.outOfBounds {
    print("The number is out of bounds.")
} catch SquareRootError.noRoot {
    print("No integer square root found.")
} catch {
    print("An unexpected error occurred: \(error).")
}
