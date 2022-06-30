//
//  IceAndFireFetcher.swift
//  IceAndFire
//
//  Created by DIDBARCH on 30.06.22.
//

import Foundation


protocol IceAndFireFetcher {
    /**
     Fetches a list of houses
     */
    func fetchHouses() async throws -> [House]
}
