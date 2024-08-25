import Cocoa

var greeting = "Hello, playground"

func buyCar(price: Int) {
    switch price {
    case 0...20_000:
        print("This seems cheap.")
    case 20_001...50_000:
        print("This seems like a reasonable car.")
    case 50_001...100_000:
        print("This had better be a good car.")
    default:
        print("default")
    }
}
buyCar(price: 32)


let root = sqrt(199)
print(root)

// 函数只有一行代码时，可以不用使用return 关键字
func areLettersIdentical(string1:String, string2:String)->Bool{
    string1.sorted()==string2.sorted()
}

func pythagoras(a:Double,b:Double)->Double{
    sqrt(a*a+b*b)
}
print(pythagoras(a: 3,b:4))

func greet(name:String)->String{
    let greetingSent = if name == "Taylor"{
        "Oh wow"
    } else {
        "Hello \(name)"
    }
    return greetingSent
}

print(greet(name: "Taylor"))

func returnTuple()->(firstName:String, lastName:String){
    (firstName:"Taylor", lastName:"Swift")
}
let taylor = returnTuple()
print("The first name is \(taylor.firstName), the last name is \(taylor.lastName)")
print(taylor.0)

let (firstName, lastName) = returnTuple()
print("The first name is \(firstName), the last name is \(lastName)")

func funcWithoutLabel(para:String) ->String{
    para
}
func funcWithUnderscoreLabel(_ para:String)->String{
    para
}
func funcWithNameLabel(lab para:String)->String{
    para
}
print(funcWithoutLabel(para: "Str1"))
print(funcWithUnderscoreLabel("str2"))
print(funcWithNameLabel(lab: "str3"))
