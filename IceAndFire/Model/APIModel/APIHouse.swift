//
//  APIHouse.swift
//  IceAndFire
//
//  Created by DIDBARCH on 01.07.22.
//

import Foundation
import SwiftUI

struct APIHouse: Hashable, Codable {
    var url: String
    var name: String
    var region: String
    var coatOfArms: String
    var words: String
    var titles: [String]
    var seats: [String]
    var currentLord: String
    var heir: String
    var overlord: String
    var founded: String
    var founder: String
    var diedOut: String
    var ancestralWeapons: [String]
    var cadetBranches: [String]
    var swornMembers: [String]
}

