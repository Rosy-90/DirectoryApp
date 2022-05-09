//
//  RoomsViewController.swift
//  DirectoryApp
//
//  Created by Rosy Patel on 09/05/2022.
//

import UIKit

class RoomsViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    private var roomViewModel: RoomsViewModel = RoomsViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource =  self
        tableView.delegate = self
        
        roomViewModel.delegate = self
        roomViewModel.getRoomsInfo()
    }
}

extension RoomsViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return roomViewModel.itemCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "roomViewCell", for: indexPath) as? RoomsTableViewCell else {
            return UITableViewCell()
        }
        
        let roomDetails = roomViewModel.getRoomIdAndStatus(for: indexPath.row)
        cell.setData(roomDetails: roomDetails)
        return cell
    }
}

extension RoomsViewController: RoomsViewModelDelegate {
    func updateUI() {
        tableView.reloadData()
    }
    
    func showError() {
        tableView.reloadData()
    }
}
