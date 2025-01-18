import Cocoa

class Game {
    var score = 0
}


class Employee {
    let hours: Int
    
    func printSummary() {
        print("I work \(hours) hours a day.")
    }

    init(hours: Int) {
        self.hours = hours
    }
}

class Developer: Employee {
    func work() {
        print("I'm working for \(hours) hours.")
    }
    override func printSummary() {
        print("I'm a developer who will sometimes work \(hours) hours a day, but other times spend hours arguing about whether code should be indented using tabs or spaces.")
    }
}

class Manager: Employee {
    func work() {
        print("I'm going to meetings for \(hours) hours.")
    }
}

let robert = Developer(hours: 8)
let joseph = Manager(hours: 10)
robert.work()
joseph.work()

let novall = Developer(hours: 8)
novall.printSummary()



class Vehicle {
    let isElectric: Bool

    init(isElectric: Bool) {
        self.isElectric = isElectric
    }
}

class Car: Vehicle {
    let isConvertible: Bool

    init(isElectric: Bool, isConvertible: Bool) {
        self.isConvertible = isConvertible
        super.init(isElectric: isElectric)
    }
}

let teslax = Car(isElectric: true, isConvertible: false)



class User {
    var username = "Anonymous"
    
    func copy() -> User {
        let user = User()
        user.username = username
        return user
    }
}

var user1 = User()
var user2 = user1.copy()

user2.username = "Taylor"
print(user1.username)
print(user2.username)


class User2 {
    let id: Int
    
    init(id: Int) {
        self.id = id
        print("User \(id): I'm alive!")
    }
    
    deinit {
        print("User \(id): I'm dead!")
    }
}

var users = [User2]()

for i in 1...3 {
    let user = User2(id: i)
    print("User \(user.id): I'm in control!")
    users.append(user)
}

print("Loop is finished")
users.removeAll()
print("Array is clear")


class User3 {
    var name = "Paul"
}

var user = User3()
user.name = "Taylor"
user = User3()
print(user.name)


// Checkpoint 7

class Animal {
    var legs: Int
    
    init(legs: Int) {
        self.legs = legs
    }
}

class Dog: Animal {
    func speak() {
        print("Bark Bark")
    }
    
    init() {
        super.init(legs: 4)
    }
}

class Cat: Animal {
    var isTame: Bool
    
    func speak() {
        print("Meow")
    }
    
    init(isTame: Bool) {
        self.isTame = isTame
        super.init(legs: 4)
    }
}

class Corgi: Dog {
    override func speak() {
        print("Bow Wow")
    }
}

class Poodle: Dog {
    override func speak() {
        print("Ruff Ruff")
    }
}

class Persian: Cat {
    override func speak() {
        print("Meowwwwww")
    }
    
    init() {
        super.init(isTame: true)
    }
}

class Lion: Cat {
    override func speak() {
        print("Roar")
    }
    
    init() {
        super.init(isTame: false)
    }
}

let alfred = Animal(legs: 6)
print(alfred.legs)

let billy = Dog()
billy.speak()

let bob = Poodle()
bob.speak()

let joey = Corgi()


let cary = Persian()
cary.speak()
print(cary.legs)
