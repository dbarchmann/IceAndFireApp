//
//  MasterViewModel.swift
//  IceAndFire
//
//  Created by DIDBARCH on 30.06.22.
//

import Foundation
import SwiftUI
import Resolver

@MainActor
final class MasterViewModel: ObservableObject {
    
    @Injected private var networkService: NetworkService
    
    @Published var houses: [House] = []
    var isFetchingData = false
    
    private var page: Int = 1
        
    func fetchData() {
        // We only fetch data once
        guard self.houses.isEmpty else {
            return
        }
        
        self.isFetchingData = true
        
        Task {
            do {
                var houses: [House] = []
                while page > 0 {
                    let apiHouses = try await networkService.fetchHouses(with: page)
                    
                    if !apiHouses.isEmpty {
                        for apiHouse in apiHouses {
                            houses.append(House(from: apiHouse))
                        }
                        if apiHouses.count == 50 {
                            page += 1
                        } else {
                            page = 0
                        }
                    } else {
                        page = 0
                    }
                    
                    self.houses = houses
                }
                self.isFetchingData = false
            } catch {
                // TODO: Propper error handling, like displaying a user facing alert or at least using a Logger, should be done here. For this demo case
                print(error)
            }
        }
    }
}
