//
//  StaffsViewController.swift
//  DirectoryApp
//
//  Created by Rosy Patel on 09/05/2022.
//

import UIKit

class StaffsViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    private var staffViewModel: StaffsViewModel = StaffsViewModel()
    
    private var columnCount: Int {
      switch UIDevice.current.userInterfaceIdiom {
      case .pad:
        return Constants.iPadColumnCount
      default:
        return Constants.iPhoneColumnCount
      }
    }
    
    private let minimumInteritemSpacing: CGFloat = 10.0
    
    lazy var flowLayout: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumInteritemSpacing = minimumInteritemSpacing
        return layout
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        staffViewModel.delegate = self
        staffViewModel.getStaffInfo()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        self.collectionView.collectionViewLayout = flowLayout
    }
}

extension StaffsViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return staffViewModel.itemCount
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "staffsViewCell", for: indexPath) as? StaffViewCell else {
            return UICollectionViewCell()
        }
        
        let staffDetails = staffViewModel.getStaffNameAndImageId(for: indexPath.row)
        cell.setData(staffDetails: staffDetails)
        return cell
    }
}

extension StaffsViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let sideInsets = collectionView.safeAreaInsets.left + collectionView.safeAreaInsets.right
        let spaceBetween = minimumInteritemSpacing * CGFloat(columnCount - 1)
        
        let cellWidth = (collectionView.bounds.width - (sideInsets + spaceBetween)) / CGFloat(columnCount)
        return CGSize(width: cellWidth, height: cellWidth)
    }
}

extension StaffsViewController: StaffViewModelDelegate {
    func updateUI() {
        collectionView.reloadData()
    }
    
    func showError() {
        collectionView.reloadData()
    }
}
