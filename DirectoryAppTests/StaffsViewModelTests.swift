//
//  StaffsViewModelTests.swift
//  DirectoryAppTests
//
//  Created by Rosy Patel on 09/05/2022.
//

import XCTest
@testable import DirectoryApp

class StaffsViewModelTests: XCTestCase {

    var mockService: MockService!
    var viewModel: StaffsViewModel!
    
    override func setUp() {
        mockService = MockService()
        viewModel = StaffsViewModel(service: mockService)
    }
    
    func testNumberOfStaffsCount() {
        mockService.responseFileName = "StaffsSuccessResponse"
        viewModel.getStaffInfo()
        let resultCount = viewModel.itemCount
        XCTAssertEqual(resultCount, 2, "Staffs count not matching")
    }
    
    func testNumberOfStaffsCountFailureScenario() {
        mockService.responseFileName =  "StaffsFailureResponse"
        viewModel.getStaffInfo()
        let resultCount = viewModel.itemCount
        XCTAssertEqual(resultCount, 0, "Staffs Search count not matching")
    }
    
    func testgetStaffNameAndImageId() {
        mockService.responseFileName =  "StaffsSuccessResponse"
        viewModel.getStaffInfo()
        
        var staffDetails = viewModel.getStaffNameAndImageId(for: 1)
        XCTAssertEqual(staffDetails.firstName, "Armando", "Staff first Name not matching")
        XCTAssertEqual(staffDetails.imageName, "https://randomuser.me/api/portraits/women/23.jpg", "Staff image url not matching")
        
        staffDetails = viewModel.getStaffNameAndImageId(for: -1)
        XCTAssertEqual(staffDetails.firstName, "", "Staff first Name not matching")
        XCTAssertEqual(staffDetails.imageName, "", "Staff image url not matching")
    }
    
    func testgetStaffDetails() {
        mockService.responseFileName =  "StaffsSuccessResponse"
        viewModel.getStaffInfo()
        
        var staffDetails = viewModel.getStaffDetails(for: 1)
        XCTAssertEqual(staffDetails?.firstName, "Armando", "Staff first Name not matching")
        XCTAssertEqual(staffDetails?.lastName, "Weber", "Staff last name not matching")
        XCTAssertEqual(staffDetails?.email, "Milton.Wisoky@gmail.com", "Staff email address not matching")
        XCTAssertEqual(staffDetails?.jobtitle, "Principal Accounts Developer", "Staff job title not matching")
        XCTAssertEqual(staffDetails?.favouriteColor, "sky blue", "Staff favourite color not matching")
        XCTAssertEqual(staffDetails?.staffID, "2", "Staff id not matching")
        
        staffDetails = viewModel.getStaffDetails(for: -1)
        XCTAssertNil(staffDetails?.firstName, "Staff first Name not matching")
        XCTAssertNil(staffDetails?.lastName, "Staff last name not matching")
        XCTAssertNil(staffDetails?.email, "Staff email address not matching")
        XCTAssertNil(staffDetails?.jobtitle, "Staff job title not matching")
        XCTAssertNil(staffDetails?.favouriteColor, "Staff favourite color not matching")
        XCTAssertNil(staffDetails?.staffID, "Staff id not matching")
    }
}
