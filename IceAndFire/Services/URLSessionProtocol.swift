//
//  URLSessionProtocol.swift
//  IceAndFire
//
//  Created by DIDBARCH on 05.07.22.
//

import Foundation

/**
 The URLSessionProtocol declares methods that are already implemented in Foundation's URLSession.
 
 The purpose of this protocol is to enable mock implementations of URLSession that can be used for unit testing
 */
protocol URLSessionProtocol {

    func data(from url: URL, delegate: URLSessionTaskDelegate?) async throws -> (Data, URLResponse)
}

/**
 This extensions makes Foundation's URLSession conform to the URLSessionProtocol
 */
extension URLSession: URLSessionProtocol { }
