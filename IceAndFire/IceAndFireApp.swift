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
        // Register all services for dependency injection
        Resolver.registerAllServices()
    }
    
    var body: some Scene {
        WindowGroup {
            MasterView(viewModel: MasterViewModel())
        }
    }
}
