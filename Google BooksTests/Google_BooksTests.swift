//
//  Google_BooksTests.swift
//  Google BooksTests
//
//  Created by Sachithra Udayanga on 2021-02-11.
//

import XCTest
import RxSwift
import RxCocoa

@testable import Google_Books

class Google_BooksTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

    func testBookSearchRequest() throws {
        let expectations = expectation(description: "The response result match the expected results")
        let disposeBag = DisposeBag()
        ApiClient.searchBooks(query: "flowers")
            .observe(on: MainScheduler.instance)
            .subscribe(onNext: { response in
                print("Book search response:", response)
                expectations.fulfill()
            }, onError: { error in
                XCTFail("Server response failed : \(error.localizedDescription)")
                expectations.fulfill()
                print(error)
            })
            .disposed(by: disposeBag)
        
        waitForExpectations(timeout: 30, handler: { (error) in
            if let error = error {
                print("Failed : \(error.localizedDescription)")
            }
        })
    }
}
