import Cocoa

var greeting = "Hello, playground"

//Checkpoint 7

class Animal {
    let legs: Int
    init(legs: Int) {
        self.legs = legs
    }
}

class Dog: Animal {
    func speak() {
        print("woof woof")
    }
}

class Cat: Animal {
    var isTame: Bool
    func speak() {
        print("Meow! Meow!")
    }
    init(isTame: Bool) {
        self.isTame = isTame
        super.init(legs: 4)
    }
}

class Corgi: Dog {
    override func speak() {
        print("A corgi says woof")
    }
}

class Poodle: Dog {
    override func speak() {
        print("A Poodle says wuuf wuuf")
    }
}

class Persian: Cat {
    override func speak() {
        print("A percian cat says meowwww!")
    }
}

class Lion: Cat {
    override func speak() {
        print("A lion doesn't meow, a lion ROARS!")
    }
}

let lioness = Lion(isTame: false)
lioness.speak()

let smallDog = Corgi(legs: 4)
smallDog.speak()
