//
//  ContentViewModel.swift
//  IceAndFire
//
//  Created by DIDBARCH on 30.06.22.
//

import Foundation
import SwiftUI

@MainActor
final class ContentViewModel: ObservableObject {
    
    @Published var houses: [House] = []
    
    let service = IceAndFireFetcherImpl()
    
    func fetchData() {
        Task.init {
            do {
                self.houses = try await service.fetchHouses()
            } catch {
                print(error)
            }
        }
    }
}
