//
//  UITestNetworkServiceMock.swift
//  IceAndFire
//
//  Created by DIDBARCH on 05.07.22.
//

import Foundation


class UITestNetworkServiceMock: NetworkService {
    
    var defaultDataSet: [APIHouse] = [APIHouse(url: "https://anapioficeandfire.com/api/houses/7", name: "House Arryn of the Eyrie", region: "The Vale", coatOfArms: "A sky-blue falcon soaring against a white moon, on a sky-blue field(Bleu celeste, upon a plate a falcon volant of the field)", words: "As High as Honor", titles: ["King of Mountain and Vale (formerly)", "Lord of the Eyrie", "Defender of the Vale", "Warden of the East"], seats: [""], currentLord: "", heir: "", overlord: "https://anapioficeandfire.com/api/houses/229", founded: "", founder: "", diedOut: "", ancestralWeapons: [""], cadetBranches: [""], swornMembers: [""])]
    
    func fetchHouses(with page: Int) async throws -> [APIHouse] {
        return defaultDataSet
    }
}
