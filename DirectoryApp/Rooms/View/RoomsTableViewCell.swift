//
//  RoomsTableViewCell.swift
//  DirectoryApp
//
//  Created by Rosy Patel on 09/05/2022.
//

import UIKit

class RoomsTableViewCell: UITableViewCell {

    @IBOutlet weak var roomId: UILabel!
    @IBOutlet weak var roomStatus: UILabel!
    
    func setData(roomDetails:(id: String, status: Bool)) {
        roomId.text = "Room Id: \(roomDetails.id)"
        roomStatus.text = roomDetails.status ? "Occupied" : "Not Occupied"
    }
}
