import Cocoa

var greeting = "Hello, playground"

//checkpoint 2
//create an array of strings, print no of items in array then print no of unique items in array

let provinces = ["British Columbia",
                "Alberta",
                "Manitoba",
                "Saskatchewan",
                "Quebec",
                "Ontario",
                "Prince Edward Island",
                "Newfoundland and Labrador",
                "New Brunswick",
                "Nova Scotia",
                "Ontario" //adding ontario as a duplicate for this assessment
]

let uniqueProvinces = Set(provinces)

print("There are \(provinces.count) provinces in Canada")

print("There are \(uniqueProvinces.count) unique provinces in Canada")


// note - obviously it would be more ideal to use an array that can contain duplicates in order to t
