//
//  ContentViewModel.swift
//  IceAndFire
//
//  Created by DIDBARCH on 30.06.22.
//

import Foundation
import SwiftUI

final class ContentViewModel: ObservableObject {
    
    @Published var houses: [House] = []
    
    let service = IceAndFireFetcherImpl()
    
    init() {
        self.fetchData()
    }
    
    func fetchData() {
        Task.init {
            do {
                self.houses = try await service.fetchHouses()
                print(houses)
            } catch {
                print(error)
            }
        }
    }
}
