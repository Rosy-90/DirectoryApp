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
        lblFirstName.text = viewModel.staffDetails.firstName
        lblLastName.text = viewModel.staffDetails.lastName
        lblEmail.text = viewModel.staffDetails.email
        lblJobTitle.text = viewModel.staffDetails.jobtitle
        lblStaffId.text = "\(viewModel.staffDetails.staffID)"
        lblFavColor.text = viewModel.staffDetails.favouriteColor
    }

}
