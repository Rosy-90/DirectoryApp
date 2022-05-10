//
//  StaffDetailViewController.swift
//  DirectoryApp
//
//  Created by Rosy Patel on 09/05/2022.
//

import UIKit

class StaffDetailViewController: UIViewController {

    @IBOutlet weak var lblFirstName: UILabel!
    @IBOutlet weak var lblLastName: UILabel!
    @IBOutlet weak var lblEmail: UILabel!
    @IBOutlet weak var lblJobTitle: UILabel!
    @IBOutlet weak var lblStaffId: UILabel!
    @IBOutlet weak var lblFavColor: UILabel!
    
    var viewModel: StaffDetailsViewModelProtocal! //ViewModel
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    func setupUI() {
        lblFirstName.text = viewModel.firstName
        lblLastName.text = viewModel.lastName
        lblEmail.text = viewModel.email
        lblJobTitle.text = viewModel.jobtitle
        lblStaffId.text = viewModel.id
        lblFavColor.text = viewModel.favouriteColor
    }

}
