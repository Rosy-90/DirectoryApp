//
//  Staffs.swift
//  DirectoryApp
//
//  Created by Rosy Patel on 09/05/2022.
//

import Foundation

// MARK: - StaffsInfo
struct StaffInfo: Codable {
    let createdAt, firstName: String
    let avatar: String
    let lastName, email, jobtitle, favouriteColor: String
    let id: String
    let data: DataClass?
    let to, fromName: String?
}

// MARK: - DataClass
struct DataClass: Codable {
    let title, body, id, toID: String
    let fromID, meetingid: String

    enum CodingKeys: String, CodingKey {
        case title, body, id
        case toID = "toId"
        case fromID = "fromId"
        case meetingid
    }
}

// MARK: - RoomsInfo
struct RoomInfo: Codable {
    let createdAt: String
    let isOccupied: Bool
    let maxOccupancy: Int
    let id: String
}
