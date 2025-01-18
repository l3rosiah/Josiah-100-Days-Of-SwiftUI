import Cocoa

func greetUser() {
    print("Hello user!")
}
greetUser()
//var greetCopy = greetUser
//greetCopy()

let sayHello = { (name: String) -> String in
    "Hi \(name)!"
}

var greetCopy: () -> Void = greetUser

func getUserData(for id: Int) -> String {
    if id == 1989 {
        return "Taylor Swift"
    } else {
        return "Anonymous"
    }
}

let data: (Int) -> String = getUserData
let user = data(1989)

print(user)

sayHello("Taylor")


let team = ["Gloria", "Suzanne", "Piper", "Tiffany", "Tasha"]
let sortedTeam = team.sorted()
print(sortedTeam)

func teamCaptainFirst(name1: String, name2: String) -> Bool {
    if name1 == "Suzanne" {
        return true
    } else if name2 == "Suzanne" {
        return false
    }
    return name1 < name2
}

//let captainFirstTeam = team.sorted(by: teamCaptainFirst)
//print(captainFirstTeam)

//let captainFirstTeam = team.sorted(by: { (name1: String, name2: String) -> Bool in
//    if name1 == "Suzanne" {
//        return true
//    } else if name2 == "Suzanne" {
//        return false
//    }
//    return name1 < name2
//})
//
//print(captainFirstTeam)

let captainFirstTeam = team.sorted { name1, name2 in
    if name1 == "Suzanne" {
        return true
    } else if name2 == "Suzanne" {
        return false
    }
    return name1 < name2
}

print(captainFirstTeam)

let reverseTeam = team.sorted { $0 > $1 }
print(reverseTeam)

let tOnly = team.filter { $0.hasPrefix("T") }
print(tOnly)

let uppercaseTeam = team.map { $0.uppercased() }
print(uppercaseTeam)


func makeArray(size: Int, using generator: () -> Int) -> [Int] {
    var numbers = [Int]()
    
    for _ in 0..<size {
        let newNumber = generator()
        numbers.append(newNumber)
    }
    return numbers
}

let rolls = makeArray(size: 10) {
    Int.random(in: 1...20)
}
print(rolls)

func generateNumber() -> Int {
    Int.random(in: 1...20)
}

let rolls2 = makeArray(size: 10, using: generateNumber)
print(rolls2)



func doImportantWork(first: () -> Void, second: () -> Void, third: () -> Void) {
    print("About to start first work")
    first()
    print("About to start second work")
    second()
    print("About to start third work")
    third()
    print("Done!")
}


doImportantWork {
    print("This is the first work")
} second: {
    print("This is the second work")
} third: {
    print("This is the third work")
}


// Checkpoint 4

let luckyNumbers = [7, 4, 38, 21, 16, 15, 12, 33, 31, 49]

var luckyStrings: [String] = luckyNumbers
    .filter { $0.isMultiple(of: 2) ? false : true }
    .sorted { $0 < $1 }
    .map { "\($0) is a lucky number" }

for luckyString in luckyStrings {
    print(luckyString)
}


