import Cocoa

enum rootError: Error {
    case outOfBounds, noRoot
}

func squareRoot(_ number: Int) throws -> Int {
    if number < 1 || number > 10_000 {
        throw rootError.outOfBounds
    } else {
        // Do the math to find square root
        var rootPairs = [Int:Int]()
        var acceptableInputs = Set<Int>()
        for i in 1...100 {
            rootPairs[i*i] = i
            acceptableInputs.insert(i*i)
        }
        
        if acceptableInputs.contains(number) {
            return rootPairs[number]!
        } else {
            throw rootError.noRoot
        }
    }
}

do {
    let answer = try squareRoot(10_000)
    print(answer)
} catch rootError.outOfBounds {
    print("The value was out of bounds")
} catch rootError.noRoot {
    print("No root")
}
