//
//  NetworkServiceTests.swift
//  IceAndFireTests
//
//  Created by DIDBARCH on 30.06.22.
//

import XCTest
import Resolver
@testable import IceAndFire

class NetworkServiceTests: XCTestCase {

    var urlSession: MockURLSession! = nil

    override func setUp() {
        super.setUp()
        
        let urlSession = MockURLSession()
        
        let container = Resolver()
        container.register { urlSession as URLSessionProtocol }
        Resolver.root = container
        
        self.urlSession = urlSession
        self.continueAfterFailure = false
    }
    
    override func tearDown() {
        self.urlSession = nil
        
        super.tearDown()
    }
    
    func testThatItGetsData() async throws {
        // Arrange
        let networkService = NetworkServiceImpl()
        
        let responseObject = [APIHouse(url: "https://anapioficeandfire.com/api/houses/1", name: "House Test", region: "The Testlands", coatOfArms: "A golden wreath, on a blue field with a gold border(Azure, a garland of laurel within a bordure or)", words: "", titles: [""], seats: [""], currentLord: "", heir: "", overlord: "https://anapioficeandfire.com/api/houses/229", founded: "", founder: "", diedOut: "", ancestralWeapons: [""], cadetBranches: [""], swornMembers: [""])]
        
        let response = HTTPURLResponse(url: URL(string: "https://anapioficeandfire.com/api/houses")!, statusCode: 200, httpVersion: nil, headerFields: nil)
        
        self.urlSession.response = response
        self.urlSession.data = try! JSONEncoder().encode(responseObject)
        
        // Act & Assert
        Task {
            do {
                let result = try await networkService.fetchHouses(with: 1)
                XCTAssertNotNil(result)
                XCTAssertEqual(result.count, 1)
                XCTAssertEqual(result.first?.name, "House Test")
                XCTAssertEqual(result.first?.region, "The Testlands")
            } catch {
                XCTFail("Unexpected result")
            }
        }
    }
    
    // TODO: Here we would normally test all the other cases, besides the "Happy Path". Like bad response or incorrect json data.
}
