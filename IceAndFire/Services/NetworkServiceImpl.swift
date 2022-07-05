//
//  NetworkServiceImpl.swift
//  IceAndFire
//
//  Created by DIDBARCH on 30.06.22.
//

import Foundation
import Resolver

public class NetworkServiceImpl: NetworkService {
    
    @LazyInjected private var urlSession: URLSessionProtocol
    
    func fetchHouses(with page: Int) async throws -> [APIHouse] {
        let houseURLString = "https://anapioficeandfire.com/api/houses?page=\(page)&pageSize=50"
        guard let houseURL = URL(string: houseURLString) else {
            return []
        }
        let (data, _) = try await self.urlSession.data(from: houseURL, delegate: nil)
        // TODO: In a real life scenario we would probably check the response first. Like checking the statusCode for non 200 codes and throwing errors. For now we're just decoding data.
        let houses = try JSONDecoder().decode([APIHouse].self, from: data)
        
        return houses
    }
}
