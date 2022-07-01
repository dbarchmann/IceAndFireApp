//
//  IceAndFireApp.swift
//  IceAndFire
//
//  Created by DIDBARCH on 30.06.22.
//

import SwiftUI
import Resolver

@main
struct IceAndFireApp: App {
    
    init() {
        Resolver.registerAllServices()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: ContentViewModel())
        }
    }
}
