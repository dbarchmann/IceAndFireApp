//
//  App+Resolver.swift
//  IceAndFire
//
//  Created by DIDBARCH on 01.07.22.
//

import Resolver

extension Resolver: ResolverRegistering {
    public static func registerAllServices() {
        register { NetworkServiceImpl() as NetworkService }.scope(.application)
    }
}
