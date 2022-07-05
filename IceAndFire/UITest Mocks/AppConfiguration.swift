//
//  AppConfiguration.swift
//  IceAndFire
//
//  Created by DIDBARCH on 05.07.22.
//

import Foundation


public enum AppEnvironment: String {
    case production = ""
    case uiTest = "xcuitest"
    
}

class AppConfiguration {
    static let shared = AppConfiguration()
    
    var environment: AppEnvironment {
        if ProcessInfo.processInfo.arguments.contains(AppEnvironment.uiTest.rawValue) {
            return .uiTest
        } else {
            return .production
        }
    }
}
