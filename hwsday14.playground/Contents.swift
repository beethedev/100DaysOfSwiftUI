import Cocoa

var greeting = "Hello, playground"

//Checkpoint 9 solution

func randomizer(values :[Int]?) -> Int {
    return values?.randomElement() ?? Int.random(in: 1...100)
}


// Testing solution works
randomizer(values: [10, 12, 131, 15])
randomizer(values: [])

let test : [Int]? = nil
randomizer(values: test)
