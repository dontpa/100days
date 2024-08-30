import Cocoa

var greeting = "Hello, playground"
class Bicycle {
    var color: String
    init(color: String) {
        self.color = color
    }
}
class MountainBike: Bicycle {
    var tireThickness: Double
    init(color: String, tireThickness: Double) {

        self.tireThickness = tireThickness
        super.init(color: color)
    }
}

class User {
    let id: Int

    init(id: Int) {
        self.id = id
        print("User \(id): I'm alive!")
    }

    deinit {
        print("User \(id): I'm dead!")
    }
}

for i in 1...3 {
    let user = User(id: i)
    print("User \(user.id): I'm in control!")
}

var users = [User]()

for i in 1...3 {
    let user = User(id: i)
    print("User \(user.id): I'm in control!")
    users.append(user)
}

print("Loop is finished!")
users.removeAll()
print("Array is clear!")

// checkpoint 7
class Animal {
    let legs : Int
    init (legs : Int){
        self.legs = legs
    }
}

class Dog : Animal {
    func speak(){
        print("Bark")
    }
}

class Cat : Animal {
    let isTame:Bool
    init(isTame:Bool, legs:Int){
        self.isTame = isTame
        super.init(legs: legs)
    }
    func speak(){
        print("miumiu")
    }
    
}

class Corgi : Dog {
    override func speak(){
        print("wawawa")
    }
}

class Poodle : Dog {
    override func speak(){
        print("wowowo")
    }
}

class Persian : Cat {
    override func speak() {
        print("miaomia")
    }
}

class Lion : Cat {
    override func speak() {
        print("aoao")
    }
}
