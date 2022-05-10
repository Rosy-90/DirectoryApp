//
//  StaffDetailsViewModel.swift
//  DirectoryApp
//
//  Created by Rosy Patel on 09/05/2022.
//

import Foundation

protocol StaffDetailsViewModelProtocal {
    var staffDetails: StaffDetails {get}
}

class StaffDetailsViewModel: StaffDetailsViewModelProtocal {
    var staffDetails: StaffDetails
    init(staffDetails: StaffDetails) {
        self.staffDetails = staffDetails
    }
}
