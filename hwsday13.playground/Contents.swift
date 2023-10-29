import Cocoa

var greeting = "Hello, playground"

//Checkpoint 8 solution

protocol Building {
    var rooms: Int {get}
    var cost: Int {get set}
    var agent: String {get set}
    
    func summary(rooms:Int, cost:Int, agent:String) -> String
}


struct House: Building {
    var rooms = 3
    var cost = 750_000
    var agent = "Ade Realty"
    
    func summary(rooms: Int, cost: Int, agent: String) -> String {
        return "This \(rooms) bedroom house sold for the competitive price of $\(cost) by the experienced agenct \(agent)."
    }
}


struct Office: Building {
    var rooms = 10
    var cost = 6_500_000
    var agent = "Jag Sidhu"
    
    func summary(rooms: Int, cost: Int, agent: String) -> String {
        return "This Office building with \(rooms) rooms was sold for $\(cost) by the experienced agent \(agent) in record time."
    }
}



let home = House()
home.summary(rooms: 4, cost: 799_900, agent: "Ade Aderinto")

let work = Office()
work.summary(rooms: 15, cost: 13_000_000, agent: "Superdude")

