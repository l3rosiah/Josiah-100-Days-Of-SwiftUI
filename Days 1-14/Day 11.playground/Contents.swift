import Cocoa



struct BankAccount {
    private(set) var funds = 0

    mutating func deposit(amount: Int) {
        funds += amount
    }

    mutating func withdraw(amount: Int) -> Bool {
        if funds >= amount {
            funds -= amount
            return true
        } else {
            return false
        }
    }
}


var account = BankAccount()
account.deposit(amount: 100)
let success = account.withdraw(amount: 200)

if success {
    print("Withdrew money successfully")
} else {
    print("Failed to get the money")
}

//account.funds -= 1000
print(account.funds)



struct School {
    static var studentCount = 0
    
    static func add(student: String) {
        print("\(student) joined the school.")
        studentCount += 1
    }
}



// Checkpoint 6

struct Car {
    let make: String
    let seats: Int
    let gears: Int
    
    private var currentGear: Int = 1
    
    mutating func shiftUp() {
        if currentGear < gears {
            currentGear += 1
            print("Shift up. Current gear: \(currentGear)")
        } else {
            print("Youre already in top gear: \(currentGear)")
        }
    }
    
    mutating func shiftDown() {
        if currentGear > 1 {
            currentGear -= 1
            print("Shift down. Current gear: \(currentGear)")
        } else {
            print("Youre already in the lowest gear: \(currentGear)")
        }
    }
    
    init(make: String, seats: Int, gears: Int) {
        self.make = make
        self.seats = seats
        self.gears = gears
    }
}

var myCar = Car(make: "Mazda", seats: 2, gears: 5)
myCar.shiftUp()
