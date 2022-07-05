//
//  MasterViewModelTests.swift
//  IceAndFireTests
//
//  Created by DIDBARCH on 05.07.22.
//

import XCTest
import Resolver
import Combine
@testable import IceAndFire

class MasterViewModelTests: XCTestCase {

    var networkService: NetworkServiceMock! = nil
    
    private var cancellables = Set<AnyCancellable>()

    override func setUp() {
        super.setUp()
        
        let networkService = NetworkServiceMock()
        
        let container = Resolver()
        container.register { networkService as NetworkService }
        Resolver.root = container
        
        self.networkService = networkService
        self.continueAfterFailure = false
    }
    
    override func tearDown() {
        self.networkService = nil
        
        super.tearDown()
    }
    
    @MainActor
    func testThatItFetchesData() {
        // Arrange
        let viewModel = MasterViewModel()
        
        let responseObject = [APIHouse(url: "https://anapioficeandfire.com/api/houses/1", name: "House Test", region: "The Testlands", coatOfArms: "A golden wreath, on a blue field with a gold border(Azure, a garland of laurel within a bordure or)", words: "", titles: [""], seats: [""], currentLord: "", heir: "", overlord: "https://anapioficeandfire.com/api/houses/229", founded: "", founder: "", diedOut: "", ancestralWeapons: [""], cadetBranches: [""], swornMembers: [""])]
        self.networkService.response = responseObject
        
        let expect = expectation(description: "Waiting for results")
                viewModel.$houses
                    .dropFirst()
                    .sink {
                        XCTAssertEqual($0.count, 1)
                        XCTAssertEqual($0.first?.name, "House Test")
                        XCTAssertEqual($0.first?.region, "The Testlands")
                        expect.fulfill()
                    }
                    .store(in: &cancellables)

        // Act
        viewModel.fetchData()
        wait(for: [expect], timeout: 3)
    }
    
    // TODO: Here we would normally test all the other cases, like pagination etc.
}
