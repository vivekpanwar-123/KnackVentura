//
//  knackVentureIOSTests.swift
//  knackVentureIOSTests
//
//  Created by 3991--CNM--GGN on 27/11/24.
//


import XCTest
@testable import knackVentureIOS

class SquareReposApp: XCTestCase {
    func testFetchRepositoriesSuccess() {
        // Mock JSON data
        let jsonData = """
        [
            {
                "name": "Repo1",
                "description": "Description of Repo1"
            },
            {
                "name": "Repo2",
                "description": "Description of Repo2"
            }
        ]
        """.data(using: .utf8)

        // Create a mock session
        let mockSession = MockURLSession()
        mockSession.data = jsonData
        mockSession.error = nil

        // Inject mock session into NetworkManager
        let networkManager = NetworkManager(session: mockSession)

        let expectation = XCTestExpectation(description: "Fetch repositories successfully")

        networkManager.fetchRepositories { result in
            switch result {
            case .success(let repositories):
                XCTAssertEqual(repositories.count, 30)
                XCTAssertEqual(repositories[0].name, "yajl-objc")
                XCTAssertEqual(repositories[0].description, "Objective-C bindings for YAJL (Yet Another JSON Library) C library")
                XCTAssertEqual(repositories[1].name, "simplerrd")
                XCTAssertEqual(repositories[1].description,"SimpleRRD provides a simple Ruby interface for creating graphs with RRD")
                expectation.fulfill()
            case .failure:
                XCTFail("Expected success but got failure")
            }
        }

        wait(for: [expectation], timeout: 2.0)
    }

    func testFetchRepositoriesFailure() {
        // Create a mock session with an error
        let mockSession = MockURLSession()
        mockSession.data = nil
        mockSession.error = NSError(domain: "TestError", code: 400, userInfo: [NSLocalizedDescriptionKey: "Mock error"])

        // Inject mock session into NetworkManager
        let networkManager = NetworkManager(session: mockSession)

        let expectation = XCTestExpectation(description: "Fetch repositories fails")

        networkManager.fetchRepositories { result in
            switch result {
            case .success:
                XCTFail("Expected failure but got success")
            case .failure(let error):
                XCTAssertEqual(error.localizedDescription, "Mock error")
                expectation.fulfill()
            }
        }

        wait(for: [expectation], timeout: 2.0)
    }
}
