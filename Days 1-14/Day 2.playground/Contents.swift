import Cocoa


// Working with booleans
let filename = "paris.jpg"
print(filename.hasSuffix(".jpg"))

let number = 120
print(number.isMultiple(of: 3))

let multiple = 120.isMultiple(of: 3)

var isAuthenticated = false
isAuthenticated = !isAuthenticated
print(isAuthenticated)
isAuthenticated = !isAuthenticated
print(isAuthenticated)

var gameOver = false
print(gameOver)

gameOver.toggle()
print(gameOver)


// String Interpolation
let firstPart = "Hello, "
let secondPart = "World!"
let greeting = firstPart + secondPart

let people = "Haters"
let action = "hate"
let lyric = people + " gonna " + action
print(lyric)

let name = "Taylor"
let age = 26

let message = "Hello my name is \(name) and I am \(age) years old."
print(message)

let equation = "5 x 5 = \(5 * 5)"
print(equation)





// Checkpoint 1!

var celcius_temp = 21.0
let fahrenheit_temp = ( Double(celcius_temp) * 9.0 / 5.0 ) + 32.0
let temp_message = """
The provided celcius temperature was \(celcius_temp) C
and the conversion to Fahrenheit gives \(fahrenheit_temp) F.
"""
print(temp_message)
