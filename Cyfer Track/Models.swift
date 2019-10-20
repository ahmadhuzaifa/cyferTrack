//
//  Models.swift
//  Cyfer Track
//
//  Created by Huzaifa Ahmed on 10/19/19.
//  Copyright © 2019 cyferlabs. All rights reserved.
//

import Foundation
import UIKit


class Item: NSObject {
    var name: String?
    var id: String?
    var type: String?
    var address: String?
    var location: Double?
    var distance: Double?

    init(dictionary: [String: AnyObject]) {
        self.name = dictionary["name"] as? String
        self.distance = dictionary["distance"] as? Double
        self.id =  dictionary["id"] as? String
        self.address =  dictionary["address"] as? String

    }
}
