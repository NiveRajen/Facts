//
//  AssessmentTests.swift
//  AssessmentTests
//
//  Created by Patric Phinehas Raj on 14/03/20.
//  Copyright © 2020 Nivedha. All rights reserved.
//

import XCTest
@testable import Assessment

class AssessmentTests: XCTestCase {

    var urlSession: URLSession!
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        urlSession = URLSession(configuration: .default)
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        urlSession = nil
    }

    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    func testCanAcceptValues() {
        let fact = Archives(title: nil, rows: [Rows(title: nil, description: nil, imageHref: nil)])
        XCTAssertNotNil(fact)
    }
    
  //Unit test for API Calls
    func testAPICall() {
        let url =
            URL(string: "https://dl.dropboxusercontent.com/s/2iodh4vg0eortkl/facts.json")
        let promise = expectation(description: "Completion handler invoked")
        var statusCode: Int?
        var responseError: Error?
        
        let dataTask = urlSession.dataTask(with: url!) { data, response, error in
            statusCode = (response as? HTTPURLResponse)?.statusCode
            responseError = error
            promise.fulfill()
        }
        dataTask.resume()
        wait(for: [promise], timeout: 5)
        
        XCTAssertNil(responseError)
        XCTAssertEqual(statusCode, 200)
    }
  
     //Check if the image is not nil
     func testNilImage() {
       let archiveIndia = Archives.init(title: "About India", rows: [Rows.init(title: "Beavers", description: "Beavers are second only to humans in their ability to manipulate and change their environment. They can measure up to 1.3 metres long. A group of beavers is called a colony", imageHref: "http://upload.wikimedia.org/wikipedia/commons/thumb/6/6b/American_Beaver.jpg/220px-American_Beaver.jpg")])
       XCTAssertTrue(archiveIndia.rows[0].imageHref != nil)
     }
     
     //Check if the image is found in location
  
  //Test whether number of rows in fact is greater than 0
  func testFacts() {
    let viewModel = Archives.init(title: "About India", rows: [Rows.init(title: "Beavers", description: "Beavers are second only to humans in their ability to manipulate and change their environment. They can measure up to 1.3 metres long. A group of beavers is called a colony", imageHref: "http://upload.wikimedia.org/wikipedia/commons/thumb/6/6b/American_Beaver.jpg/220px-American_Beaver.jpg")])

    XCTAssertTrue(viewModel.rows.count > 0)
  }
  
  //Unit test to check whether the image is in specified location
  func testImageInPath() {
      let url =
          URL(string: "http://upload.wikimedia.org/wikipedia/commons/thumb/6/6b/American_Beaver.jpg/220px-American_Beaver.jpg")
      let promise = expectation(description: "Completion handler invoked")
      var responseData: Data?
          
      let dataTask = urlSession.dataTask(with: url!) { data, response, error in
          responseData = data
          promise.fulfill()
      }
      dataTask.resume()
      wait(for: [promise], timeout: 5)
      
      XCTAssertNotNil(responseData)
  }
  
  //Unit test for checking whether the Json encodes in the Model i.e valid json
  func testJsonEncoding() {
    let url =
        URL(string: "https://dl.dropboxusercontent.com/s/2iodh4vg0eortkl/facts.json")
    let promise = expectation(description: "Completion handler invoked")
    var responseData: Data?
        
    let dataTask = urlSession.dataTask(with: url!) { data, response, error in
        responseData = data
        promise.fulfill()
    }
    dataTask.resume()
    wait(for: [promise], timeout: 5)
    
    XCTAssertNotNil(responseData)
    
    let str = String(decoding: responseData!, as: UTF8.self)
    XCTAssertNotNil(str)
    let jsonData = str.data(using: .utf8)!
    XCTAssertNoThrow(try! JSONDecoder().decode(Archives.self, from: jsonData) as? Archives)
    
  }
  
}
