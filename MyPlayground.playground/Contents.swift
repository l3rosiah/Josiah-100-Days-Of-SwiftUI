let string = 
"""
G01 X247.951560 Y11.817060 Z-1.000000 F400.000000
G01 X247.951560 Y11.817060 Z-1.000000 F400.000000
G01X247.951560Y11.817060Z-1.000000F400.000000
"""

let alphabet = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z"]

func addSpaces(_ string: String) -> String {
    var result = ""
    var ignoreMode = false // Flag to ignore lines surrounded by parentheses
    var isFirstLetter = true // Flag to track first letter of each line
    
    for char in string {
        switch char {
        case "(":
            ignoreMode = true
            result.append(char)
        case ")":
            ignoreMode = false
            result.append(char)
        case "\n":
            isFirstLetter = true
            result.append(char)
        case " ":
            result.append("")
        case let c where c.isLetter && !ignoreMode:
            if isFirstLetter {
                result.append(c)
                isFirstLetter = false
            } else {
                result.append(" \(c)")
            }
        default:
            result.append(char)
        }
    }
    
    return result
}

print(addSpaces(string))
