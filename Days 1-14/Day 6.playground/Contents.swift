import Cocoa

// Loops

let platforms = ["iOS", "macOS", "tvOS", "watchOS"]

for os in platforms {
    print(os)
}

for i in 1...12 {
    print("5 x \(i) = \(5 * i)")
}

for i in 1...12 {
    for j in 1...12 {
        print("\(j) * \(i) = \(j * i)")
    }
    print()
}

for i in 1...5 {
    print("Counting from 1 through 5: \(i)")
}

print()

for i in 1..<5 {
    print("Counting 1 up to 5: \(i)")
}

var lyric = "Haters gonna hate"

for _ in 1...5 {
    lyric += " hate"
}
print(lyric)

let names = ["Piper", "Alex", "Suzanne", "Gloria"]

print(names[1...])

// While loops
print()
print()
print("While Loops!")
print()
print()

var countdown = 10

while countdown > 0 {
    print("\(countdown)…")
    countdown -= 1
}

print("Blast off!")


let randomInt = Int.random(in: 1...1000)
let randomDouble = Double.random(in: 0...1)

print(" \n\n\n\n " )

var roll = 0
while roll != 20 {
    roll = Int.random(in: 1...20)
    print("Your roll was \(roll)!")
}
print("Critical hit!")

let filenames = ["me.jpg", "work.txt", "sophie.jpg", "logo.psd"]

for filename in filenames {
    if filename.hasSuffix(".jpg") == false {
        continue
}

    print("Found picture: \(filename)")
}

let number1 = 4
let number2 = 14
var multiples = [Int]()

for i in 1...100_000 {
    if i.isMultiple(of: number1) && i.isMultiple(of: number2) {
        multiples.append(i)
        if multiples.count == 10 {
            break
        }
    }
}
print(multiples)


let options = ["up", "down", "left", "right"]
let secretCombination = ["up", "up", "right"]

outerLoop: for option1 in options {
    for option2 in options {
        for option3 in options {
            print("In loop")
            let attempt = [option1, option2, option3]
            if attempt == secretCombination {
                print("The combination is \(attempt)!")
                break outerLoop
            }
        }
    }
}

// Checkpoint 3
print(" \n\n CHECKPOINT 3 \n\n")

for i in 1...100 {
    if i % 3 == 0 && i % 5 == 0 {
        print("FizzBuzz")
    } else if i % 5 == 0 {
        print("Buzz")
    } else if i % 3 == 0 {
        print("Fizz")
    } else {
        print("\(i)")
    }
}

print(" \n\n CHECKPOINT 3 \n\n")

//var boolCheck: Bool = true
for i in 1...100 {
    switch true {
    case i.isMultiple(of: 5) && i.isMultiple(of: 3):
        print("FizzBuzz")
    case i.isMultiple(of: 5):
        print("Buzz")
    case i.isMultiple(of: 3):
        print("Fizz")
    default:
        print(i)
    }
}

