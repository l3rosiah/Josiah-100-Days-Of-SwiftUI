import Cocoa

// Variables
var greeting = "Hello, playground"
var name = "Ted"
name = "Rebecca"
name = "Keeley"

// Constants cant change
let character = "Daphne"

var playerName = "Roy"
print(playerName)

playerName = "Dani"
print(playerName)

playerName = "Sam"
print(playerName)

// Constants
let managerName = "Michael Scott"
let dogBreed = "Samoyed"
let meaningOfLife = "How many roads must a man walk?"

// Strings
let filename = "paris.jpg"
let quote = "This is a long message with \"quotes\""
print(quote)

let movie = """
A day in the
life of an Apple
engineer
"""

print(movie.count)

let nameLength = managerName.count
print(nameLength)

print(managerName.uppercased())

print(movie.hasPrefix("A day"))
print(filename.hasSuffix(".jpg"))

// Integers
let score = 10
let reallyBig = 100_000_000 // Swift ignores the underscores

let lowerScore = score - 2
let higherScore = score + 10
let doubledScore = score * 2
let squaredScore = score * score
let halvedScore = score / 2

var counter = 10
counter += 5 // Counter compound assignment operators
print(counter)

counter *= 2
counter -= 10
counter /= 2

let number = 120
print(number.isMultiple(of: 3))
print(120.isMultiple(of: 3))

// Floats

let floatNumber = 0.1 + 0.2
print(number)

let a = 1
let b = 2.0
let c = Double(a) + b

let double1 = 3.1
let double2 = 3131.3131
let double3 = 3.0
let int1 = 3

var actorName = "Nicholas Cage"
actorName = "John Travolta"

var rating = 5.0
rating *= 2



