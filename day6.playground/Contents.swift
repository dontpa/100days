import Cocoa

var greeting = "Hello, playground"

let alphabet = ["a","b","c","d"]
for item in alphabet{
    print(item)
}

for i in 1...12{
    print("5 * \(i) is \(5 * i)")
}

for i in 1..<12{
    print(i)
}

for _ in 1...5{
    print ("times 5")
}

let id = Int.random(in: 1...1000)
let amount = Double.random(in: 0...1)

var roll = 0
var count = 0
while roll != 20{
    roll = Int.random(in: 1...1000)
    count += 1
    print("this time is \(roll)")
}
print(count)
print("roll ends")

var number: Int = 10
while number > 0 {
    number -= 2
    if number.isMultiple(of: 2) {
        print("\(number) is an even number.")
    }
}

for i in 1...10{
    print("i=\(i)")
    for j in 1...10{
        print("j=\(j)")
        print("\(i) * \(j) = \(i * j)")
        if i * j == 6 {
            break
        }
    }
}

outerLoop : for i in 1...10{
    print("i=\(i)")
    for j in 1...10{
        print("j=\(j)")
        print("\(i) * \(j) = \(i * j)")
        if i * j == 6 {
            break outerLoop
        }
    }
}

print("----")

for i in 1...100{
    let multipleOf3 = i.isMultiple(of: 3)
    let multipleOf5 = i.isMultiple(of: 5)
    if multipleOf3 && multipleOf5{
        print("FizzBuzz")
    } else if multipleOf3{
        print("Fizz")
    } else if multipleOf5 {
        print("Buzz")
    } else {
        print(i)
    }
}
