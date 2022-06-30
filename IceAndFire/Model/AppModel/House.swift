//
//  House.swift
//  IceAndFire
//
//  Created by DIDBARCH on 30.06.22.
//

import Foundation
import SwiftUI

struct House: Hashable, Codable, Identifiable {
    var id: String
    var url: String
    var name: String
    var region: String
    
    private var coatOfArmsImage: Image {
        Image(name)
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
