//
//  App+Resolver.swift
//  IceAndFire
//
//  Created by DIDBARCH on 01.07.22.
//

import Resolver
import Foundation

extension Resolver: ResolverRegistering {
    public static func registerAllServices() {
        switch AppConfiguration.shared.environment {
        case .production:
            register { NetworkServiceImpl() as NetworkService }.scope(.application)
            register(URLSessionProtocol.self) {
                return URLSession(configuration: .default)
            }
        case .uiTest:
            register { UITestNetworkServiceMock() as NetworkService }.scope(.application)
            register(URLSessionProtocol.self) {
                return URLSession(configuration: .default)
            }
        }
    }
}
