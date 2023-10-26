import Cocoa

var greeting = "Hello, playground"

//Closures and Checkpoint5
//Your job is to:
//Filter out any numbers that are even
//Sort the array in ascending order
//Map them to strings in the format “7 is a lucky number”
//Print the resulting array, one item per line
//So, your output should be as follows:
//7 is a lucky number
//15 is a lucky number
//21 is a lucky number
//31 is a lucky number
//33 is a lucky number
//49 is a lucky number

//Solution

let luckyNumbers = [7, 4, 38, 21, 16, 15, 12, 33, 31, 49]

let filterSortMap = luckyNumbers.filter{$0.isMultiple(of: 2) == false}.sorted().map{String("\($0) is a lucky number")}
    

for luckyNumber in filterSortMap{
    print(luckyNumber)
}
//Solution 2
luckyNumbers.filter{!$0.isMultiple(of: 2)}.sorted().map{print("\($0) is a lucky number")}
