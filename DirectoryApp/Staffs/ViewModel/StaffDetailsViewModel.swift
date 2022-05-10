//
//  StaffDetailsViewModel.swift
//  DirectoryApp
//
//  Created by Rosy Patel on 09/05/2022.
//

import Foundation

protocol StaffDetailsViewModelProtocal {
    var firstName: String {get}
    var lastName: String {get}
    var email: String {get}
    var jobtitle: String {get}
    var id: String {get}
    var favouriteColor: String {get}
}

class StaffDetailsViewModel: StaffDetailsViewModelProtocal {
    
    var firstName: String
    var lastName: String
    var email: String
    var jobtitle: String
    var id: String
    var favouriteColor: String
    
    init(staffDetails:(firstName: String,
                     lastName: String,
                     email: String,
                     jobtitle: String,
                     id: String,
                     favouriteColor: String)) {
        self.firstName = staffDetails.firstName
        self.lastName = staffDetails.lastName
        self.email = staffDetails.email
        self.jobtitle = staffDetails.jobtitle
        self.id = staffDetails.id
        self.favouriteColor = staffDetails.favouriteColor
    }
}
