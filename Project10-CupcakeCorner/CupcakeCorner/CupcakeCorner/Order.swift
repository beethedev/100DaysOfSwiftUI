//
//  Order.swift
//  CupcakeCorner
//
//  Created by Busayo Ajide on 12/6/23.
//

import SwiftUI

struct Address: Codable{
    var name = ""
    var streetAddress = ""
    var city = ""
    var zip = ""
    
    var hasValidAddress: Bool {
        if name.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty || streetAddress.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty || city.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty || zip.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
            return false
        }

        return true
    }
}

@Observable
class Order: Codable {
    static let types = ["Vanilla", "Strawberry", "Chocolate", "Rainbow"]

    var type = 0
    var quantity = 3

    var extraFrosting = false
    var addSprinkles = false
    
    var specialRequestEnabled = false {
        didSet {
            if specialRequestEnabled == false {
                extraFrosting = false
                addSprinkles = false
            }
        }
    }
    
    var cost: Double {
        // $2 per cake
        var cost = Double(quantity) * 2

        // complicated cakes cost more
        cost += (Double(type) / 2)

        // $1/cake for extra frosting
        if extraFrosting {
            cost += Double(quantity)
        }

        // $0.50/cake for sprinkles
        if addSprinkles {
            cost += Double(quantity) / 2
        }

        return cost
    }
    
    enum CodingKeys: String, CodingKey {
        case _type = "type"
        case _quantity = "quantity"
        case _specialRequestEnabled = "specialRequestEnabled"
        case _extraFrosting = "extraFrosting"
        case _addSprinkles = "addSprinkles"
//        case _name = "name"
//        case _city = "city"
//        case _streetAddress = "streetAddress"
//        case _zip = "zip"
        case _address = "address"
    }
    
    var address = Address(){
        didSet {
            if let encoded = try? JSONEncoder().encode(address) {
                        UserDefaults.standard.set(encoded, forKey: "Address")
                    }
        }
    }
    
    init() {
        if let savedItems = UserDefaults.standard.data(forKey: "Address") {
            if let decodedItems = try? JSONDecoder().decode(Address.self, from: savedItems) {
                address = decodedItems
                return
            }
        }
    }
}
