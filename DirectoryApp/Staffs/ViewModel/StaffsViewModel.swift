//
//  StaffsViewModel.swift
//  DirectoryApp
//
//  Created by Rosy Patel on 09/05/2022.
//

import Foundation

protocol StaffViewModelDelegate: AnyObject {
    func updateUI()
    func showError()
}

protocol StaffViewModelProtocol {
    var itemCount: Int {get}
    func getStaffInfo()
    func getStaffNameAndImageId(for row: Int) -> (imageName: String, firstName: String)
    func getStaffDetails(for row: Int) -> (firstName: String,
                                           lastName: String,
                                           email: String,
                                           jobtitle: String,
                                           staffID: String,
                                           favouriteColor: String)
    var delegate: StaffViewModelDelegate? { get set }
}

class StaffsViewModel {
    
    weak var delegate: StaffViewModelDelegate?
    let service: Servicable!
    private var staffsInfo: [StaffInfo]?
    
    var itemCount: Int {
        return staffsInfo?.count ?? 0
    }
    
    init(service: Servicable =  Service()) {
        self.service = service
    }
}

extension StaffsViewModel: StaffViewModelProtocol {
    /*
     this method connect calls rest API to get data
     */
    func getStaffInfo() {
        
        let networkCient = NetworkClient(baseURL: EndPoints.peopleUrl.rawValue, method: "get")
        service.fetchData(networkClient: networkCient, type: StaffInfo.self) { [weak self] (result) in
            switch result {
            case .success(let result):
                self?.staffsInfo = result
                DispatchQueue.main.async {
                    self?.delegate?.updateUI()
                }
            case .failure(_):
                self?.staffsInfo = nil
                DispatchQueue.main.async {
                    self?.delegate?.showError()
                }
            }
        }
    }
    
    func getStaffNameAndImageId(for row: Int) -> (imageName: String, firstName: String) {
        guard itemCount > row, row >= 0,  let staffInfo = staffsInfo?[row] else {
            return ("", "")
        }
        let imageRefId = staffInfo.avatar
        return (imageRefId, staffInfo.firstName)
    }
    
    func getStaffDetails(for row: Int) -> (firstName: String, lastName: String, email: String, jobtitle: String, staffID: String, favouriteColor: String) {
        guard  itemCount > row , row >= 0 , let staffInfo = staffsInfo?[row] else {
            return ("", "", "", "", "", "")
        }
        return (staffInfo.firstName, staffInfo.lastName, staffInfo.email, staffInfo.jobtitle, staffInfo.id, staffInfo.favouriteColor )
    }
}
