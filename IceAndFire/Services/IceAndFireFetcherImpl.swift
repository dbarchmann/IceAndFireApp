//
//  IceAndFireFetcher.swift
//  IceAndFire
//
//  Created by DIDBARCH on 30.06.22.
//

import Foundation


public class IceAndFireFetcherImpl: IceAndFireFetcher {
    
    private static let houseURLString = "https://anapioficeandfire.com/api/houses"
    
    func fetchHouses() async throws -> [House] {
        guard let houseURL = URL(string: IceAndFireFetcherImpl.houseURLString) else {
            return []
        }
        let (data, _) = try await URLSession.shared.data(from: houseURL)
        let apiModel = try JSONDecoder().decode([APIHouse].self, from: data)
        
        var houses: [House] = []
        for apiHouse in apiModel {
            houses.append(House(from: apiHouse))
        }
        
        return houses
    }
}
