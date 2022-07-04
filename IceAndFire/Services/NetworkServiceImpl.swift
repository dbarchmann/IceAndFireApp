//
//  NetworkServiceImpl.swift
//  IceAndFire
//
//  Created by DIDBARCH on 30.06.22.
//

import Foundation


public class NetworkServiceImpl: NetworkService {
    
    func fetchHouses(with page: Int) async throws -> [APIHouse] {
        let houseURLString = "https://anapioficeandfire.com/api/houses?page=\(page)&pageSize=50"
        guard let houseURL = URL(string: houseURLString) else {
            return []
        }
        let (data, _) = try await URLSession.shared.data(from: houseURL)
        let houses = try JSONDecoder().decode([APIHouse].self, from: data)
        
        return houses
    }
}
