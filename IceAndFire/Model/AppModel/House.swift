//
//  House.swift
//  IceAndFire
//
//  Created by DIDBARCH on 30.06.22.
//

import Foundation
import SwiftUI
import UIKit

struct House: Hashable, Codable, Identifiable {
    var id: String
    var url: String
    var name: String
    var region: String
    
    var coatOfArmsImage: UIImage {
        if let uiImage = UIImage(named: "House " + name.split(separator: " ")[1]) {
            return uiImage
        } else {
            return UIImage(named: "Unknown")!
        }
    }
    
    init(id: String, url: String, name: String, region: String) {
        self.id = id
        self.url = url
        self.name = name
        self.region = region
    }
    
    init(from apiModel: APIHouse) {
        self.id = UUID().uuidString
        self.url = apiModel.url
        self.name = apiModel.name
        self.region = apiModel.region
    }
}
