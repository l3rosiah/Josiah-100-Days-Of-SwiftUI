import Cocoa

// Type annotations

var greeting: String = "Hello, playground"
var score: Double = 0
var isAuth: Bool = true
var albums: [String] = ["Beautiful Letdown"]
var userData: [String: String] = ["Bro": "Nado"]
var books: Set<String> = Set(["Woo", "Sleep"])

var teams: [String] = [String]()
var teams2: [String] = []
var teams3 = [String]()

enum UIStyle {
    case light, dark, system
}
var style = UIStyle.light


let username: String
// lots of complex logic
username = "@twostraws"
// lots more complex logic
print(username)


// Challenge 3

let numberList = [1, 3, 2, 4, 2, 7, 8, 8, 3, 7, 10]
let uniqueNumberList = Set(numberList)

print("Items in number list: \(numberList.count)")
print("Unique items in number list: \(uniqueNumberList.count)")
