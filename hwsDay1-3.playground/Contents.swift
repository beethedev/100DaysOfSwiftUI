import Cocoa

var greeting = "Hello, playground"

let celsius = 16.0

var farenheit = celsius * 9.0 / 5.0 + 32.0

print("\(celsius) degC is equal to \(farenheit) degF.")


let presidents = ["Bush", "Obama", "Trump", "Biden"]
let reversedPresidents = presidents.reversed()
print(reversedPresidents)


let employee2 = ["name": "Taylor Swift","job": "Singer","location": "Nashville"]

//print(employee2["name"])
//print(employee2["job"])
//print(employee2["location"])

print(employee2["name", default: "Unknown"])
print(employee2["job", default: "Unknown"])
print(employee2["location", default: "Unknown"])

enum Weekday {
    case monday
    case tuesday
    case wednesday
    case thursday
    case friday
}

var day = Weekday.monday

day = .friday
