import Cocoa

// Functions

func showWelcome() {
    print("Welcome to my app!")
    print("By default This prints out a conversion")
    print("chart from centimeters to inches, but you")
    print("can also set a custom range if you want.")
}

func printTimesTable (number: Int, end: Int) {
    for i in 1...end {
        print("\(i) x \(number) = \(i * number)")
    }
}

printTimesTable(number: 5, end: 20)

func compareStrings(string1: String, string2: String) -> Bool {
    string1.sorted() == string2.sorted()
}

print(compareStrings(string1: "abc", string2: "cab"))


func pythagorus(a: Double, b: Double) -> Double {
    sqrt(a*a + b*b)
}

print(pythagorus(a: 3, b: 4))
