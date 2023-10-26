import Cocoa

var greeting = "Hello, playground"

//Structs and Checkpoint 6

struct Car {
    let model : String
    let noOfSeats : Int
    var currentGear = 1 {
        didSet {
            print("You have changed from gear \(oldValue) to \(currentGear).")
        }
    }
    
    init(model: String, seats: Int){
        self.model = model
        self.noOfSeats = seats
    }
    
    mutating func changingGear(to no:Int){
        if (no <= 0 || no > 10){
            print("That gear is not possible, try again.")
        } else if no == currentGear{
            print("You are currently on gear \(no)")
        } else if no <= 10 {
            currentGear = no
        }
    }
}

var Camry = Car(model: "Corolla", seats: 5)
Camry.changingGear(to: 3)
Camry.changingGear(to: 5)
Camry.changingGear(to: 10)
