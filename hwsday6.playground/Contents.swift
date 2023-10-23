import Cocoa

var greeting = "Hello, playground"

var lyric = "Haters gonna"

for _ in 1...5 {
    lyric += " hate"
}

print(lyric)

var cats: Int = 0
while cats < 10 {
    cats += 1
    print("I'm getting another cat.")
    if cats == 4 {
        print("Enough cats!")
        cats = 10
    }
}

// Checkpoint 3 fizzbuzz

//Solution 1
var no = 1
while no <= 100{
    if  no % 3 == 0 && no % 5 == 0{
        print("fizzbuzz")
    }
    else if no % 5 == 0 {
        print("buzz")
    }
    else if no % 3 == 0 {
        print("fizz")
    } else {
        print(no)
    }
    no += 1
}

print(5.isMultiple(of: 5))

//Solution 2

for val in 1...100 {
    if val.isMultiple(of: 3) && val.isMultiple(of: 5) {
        print("fizzbuzz")
    }
    else if val.isMultiple(of: 5) {
        print("buzz")
    }
    else if val.isMultiple(of: 3) {
        print("fizz")
    } else {
        print(val)
    }
}
