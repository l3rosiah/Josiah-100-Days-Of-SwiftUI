import Cocoa

let opposites = [
    "Mario": "Wario",
    "Luigi": "Waluigi"
]

let peachOpposite = opposites["Peach"]

if let marioOpposite = opposites["Mario"] {
    print("Mario's opposite is \(marioOpposite)")
}


var username: String? = nil

if let unwrappedName = username {
    print("We got a user: \(unwrappedName)")
} else {
    print("The optional was empty.")
}


func square(number: Int) -> Int {
    number * number
}

var number: Int? = nil

if let number {
    print(square(number: number))
}


//// Guard
//func printSquare(of number: Int?) {
//    guard let number = number else {
//        print("Missing input")
//        return
//    }
//
//    print("\(number) x \(number) is \(number * number)")
//}

var myVar: Int? = 3

if let unwrapped = myVar {
    print("Run if myVar has a value inside")
}

//guard let unwrapped = myVar else {
//    print("Run if myVar doesn't have a value inside")
//}

func printSquare(of number: Int?) {
    guard let number = number else {
        print("Missing input")

        // 1: We *must* exit the function here
        return
    }

    // 2: `number` is still available outside of `guard`
    print("\(number) x \(number) is \(number * number)")
}

// Nil Coalescing
let captains = [
    "Enterprise": "Picard",
    "Voyager": "Janeway",
    "Defiant": "Sisko"
]

let new = captains["Serenity"] ?? "N/A"
print(new)

let new2 = captains["Serenity", default: "N/A"] // Different from this bc it can work on any optional

let tvShows = ["Archer", "Babylon 5", "Ted Lasso"]
let favorite = tvShows.randomElement() ?? "None"


struct Book {
    let title: String
    let author: String?
}

let book = Book(title: "Beowulf", author: nil)
let author = book.author ?? "Anonymous"
print(author)

let input = ""
let number2 = Int(input) ?? 0
print(number2)


func aH (_ input: [Int]?) -> Int { input?.randomElement() ?? Int.random(in: 1...100) }

print(aH([1, 2, 3, 4]))
print(aH(nil))
