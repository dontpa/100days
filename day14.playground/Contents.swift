import Cocoa

var greeting = "Hello, playground"

let opposites = [
    "Mario": "Wario",
    "Luigi": "Waluigi"
]

if let peachOpposite = opposites["Peach"]{
    print("print\(peachOpposite)")
}
//print(peachOpposite)

var username:String? = nil
username = "value"
var number:Int? = 3
func square(number:Int)-> Int{
    number * number
}
if let number = number{
    print(square(number: number))
}

let captains = [
    "Enterprise": "Picard",
    "Voyager": "Janeway",
    "Defiant": "Sisko"
]

let new = captains["Serenity"] ?? "N/A"

print(new)

var conferenceName: String? = "WWDC"
var conference: String = conferenceName ?? ""

let names = ["Arya", "Bran", "Robb", "Sansa"]

let chosen = names.randomElement()?.uppercased()
print("Next in line: \(chosen)")

struct Book {
    let title: String
    let author: String?
}

var book: Book? = Book(title: "Bookname", author: "Dauthor")
var book1: Book? = Book(title: "Bookname", author: "Bauthor")
var book2: Book? = Book(title: "Bookname", author: "aauthor")
var book3: Book? = Book(title: "Bookname", author: "cauthor")
let author = book?.author?.first?.uppercased() ?? "A"
print(author)

let names2 = ["Taylor", "Paul", "Adele"]
//let lengthOfLast = names2.last?.count?

enum UserError: Error {
    case badID, networkFailed
}

func getUser(id: Int) throws -> String? {
    throw UserError.networkFailed
}

if let user = try? getUser(id: 23) {
    print("User: \(user)")
}

let anotherUser = (try? getUser(id: 23)) ?? "Anonymous"

// checkpoint 9
func randomItem(numbers:[Int]?)->Int{
    numbers?.randomElement() ?? Int.random(in: 1...100)
}
print(randomItem(numbers: nil))
print(randomItem(numbers: [2,5,1,6,7]))
