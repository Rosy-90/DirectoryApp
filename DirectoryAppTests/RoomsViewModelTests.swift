//
//  RoomsViewModelTests.swift
//  DirectoryAppTests
//
//  Created by Rosy Patel on 09/05/2022.
//

import XCTest
@testable import DirectoryApp

class RoomsViewModelTests: XCTestCase {

    var mockService: MockService!
    var viewModel: RoomsViewModel!
    
    override func setUp() {
        mockService = MockService()
        viewModel = RoomsViewModel(service: mockService)
    }
//    var itemCount: Int {get}
//    func getRoomsInfo()
//    func getRoomIdAndStatus(for row: Int) -> (id: String, status: Bool)

    func testNumberOfRoomsCount() {
        mockService.responseFileName = "RoomsSuccessResponse"
        viewModel.getRoomsInfo()
        let resultCount = viewModel.itemCount
        XCTAssertEqual(resultCount, 3, "Rooms count not matching")
    }
    
    func testNumberOfRoomsCountFailureScenario() {
        mockService.responseFileName =  "RoomsFailureResponse"
        viewModel.getRoomsInfo()
        let resultCount = viewModel.itemCount
        XCTAssertEqual(resultCount, 0, "Rooms Search count not matching")
    }
    
    func testgetRoomIdAndStatus() {
        mockService.responseFileName =  "RoomsSuccessResponse"
        viewModel.getRoomsInfo()
        
        var staffDetails = viewModel.getRoomIdAndStatus(for: 1)
        XCTAssertEqual(staffDetails.id, "2", "Room Id not matching")
        XCTAssertEqual(staffDetails.status, false, "Room occupancy status not matching")
        
        staffDetails = viewModel.getRoomIdAndStatus(for: -1)
        XCTAssertEqual(staffDetails.id, "", "Room Id not matching")
        XCTAssertEqual(staffDetails.status, false, "Room occupancy status not matching")
    }
}
