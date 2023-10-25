import Cocoa

var greeting = "Hello, playground"


//Throwing functions and Checkpoint 3

enum sqrtError: Error {
    case outOfBounds
    case noRoot
}

func findSqrt(of number: Int) throws -> Int{
    var squares = [Int:Int]()
    for no in 1...100 {
        let square = no * no
        squares[square] = no
    }
    let result = squares[number, default: 0]
    if number >= 1  || number <= 10_000 {
        return result
    } else if number < 1 || number > 10_000 {
        throw sqrtError.outOfBounds
    } else if result == 0 {
        throw sqrtError.noRoot
    }
    return result
}

let val = 3600
do {
    let sqrt = try findSqrt(of: val)
    print("Squareroot of \(val) is \(sqrt)")
} catch {
    print("Error found")
}

try findSqrt(of: 64)
try findSqrt(of: 10_000)
try findSqrt(of: 1)
//try findSqrt(of: 10_101)
//try findSqrt(of: 3)
try findSqrt(of: 9)
