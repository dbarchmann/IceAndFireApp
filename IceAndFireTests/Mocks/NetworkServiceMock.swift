//
//  NetworkServiceMock.swift
//  IceAndFireTests
//
//  Created by DIDBARCH on 05.07.22.
//

import Foundation
@testable import IceAndFire


class NetworkServiceMock: NetworkService {
    
    var response: [APIHouse] = []
    
    func fetchHouses(with page: Int) async throws -> [APIHouse] {
        return response
    }
    
    
}
