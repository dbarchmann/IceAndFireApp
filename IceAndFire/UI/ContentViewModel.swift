//
//  ContentViewModel.swift
//  IceAndFire
//
//  Created by DIDBARCH on 30.06.22.
//

import Foundation
import SwiftUI
import Resolver

@MainActor
final class ContentViewModel: ObservableObject {
    
    @Published var houses: [House] = []
    
    @Injected private var networkService: NetworkService
    
    func fetchData() {
        Task.init {
            do {
                self.houses = try await networkService.fetchHouses()
            } catch {
                print(error)
            }
        }
    }
}
