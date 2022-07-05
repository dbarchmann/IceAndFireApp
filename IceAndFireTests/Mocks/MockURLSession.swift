//
//  MockURLSession.swift
//  IceAndFireTests
//
//  Created by DIDBARCH on 05.07.22.
//

import Foundation
@testable import IceAndFire


struct GenericError: Error {
    var errorDescription: String {
        return "Something went wrong"
    }
}


class MockURLSession: URLSessionProtocol {
    
    var response: URLResponse?
    var data: Data?
    
    func data(from url: URL, delegate: URLSessionTaskDelegate? = nil) async throws -> (Data, URLResponse) {
        guard let data = data, let response = response else {
            throw GenericError()
        }
        
        return (data, response)
    }
}
