//
//  StaffsDetailViewModelTests.swift
//  DirectoryAppTests
//
//  Created by Rosy Patel on 10/05/2022.
//

import XCTest
@testable import DirectoryApp

class StaffsDetailViewModelTests: XCTestCase {
    
    var viewModel: StaffDetailsViewModel!
 
    override func setUp() {
        viewModel = StaffDetailsViewModel(staffDetails: StaffDetails(firstName: "Armando", lastName: "Weber", email: "Milton.Wisoky@gmail.com", jobtitle: "Principal Accounts Developer", staffID: "2", favouriteColor: "sky blue"))
    }
                                          
    func testStaffDetails() {
        XCTAssertEqual(viewModel.staffDetails.firstName, "Armando", "First name not matching")
        XCTAssertEqual(viewModel.staffDetails.lastName, "Weber", "Last name not matching")
        XCTAssertEqual(viewModel.staffDetails.email, "Milton.Wisoky@gmail.com", "Email address not matching")
        XCTAssertEqual(viewModel.staffDetails.jobtitle, "Principal Accounts Developer", "Job title not matching")
        XCTAssertEqual(viewModel.staffDetails.staffID, "2", "Staff id not matching")
        XCTAssertEqual(viewModel.staffDetails.favouriteColor, "sky blue", "Staff id not matching")
    }
}
