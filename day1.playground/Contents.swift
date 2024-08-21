import Cocoa

var greeting :String = "Hello, playground"
print(greeting)

let movie = "a movie name"
print(movie.count)

print(movie.uppercased())
print(movie)
print(movie.hasPrefix("a"))

let multilinestr = """
a multiline string "
another line
"""
print(multilinestr)

let intnumber = 100_000_000
print(intnumber.isMultiple(of: 50))
print(intnumber/3)

let number = 0.1 + 0.2
print(number)

var aboolean = false
print(aboolean)
aboolean.toggle()
print(aboolean)


// checkpoint 1
let celsius : Double = 38
let calculated = celsius * 9 / 5 + 32
print("the Fahrenheit temperature is \(calculated)°")
