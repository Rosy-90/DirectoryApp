//
//  RoomsViewModel.swift
//  DirectoryApp
//
//  Created by Rosy Patel on 09/05/2022.
//

import Foundation

protocol RoomsViewModelDelegate: AnyObject {
    func updateUI()
    func showError()
}

protocol RoomsViewModelProtocol {
    var itemCount: Int {get}
    func getRoomsInfo()
    func getRoomIdAndStatus(for row: Int) -> (id: String, status: Bool)
    var delegate: RoomsViewModelDelegate? { get set }
}

class RoomsViewModel {
    
    weak var delegate: RoomsViewModelDelegate?
    let service: Servicable!
    private var roomsInfo: [RoomInfo]?
    
    var itemCount: Int {
        return roomsInfo?.count ?? 0
    }
    
    init(service: Servicable =  Service()) {
        self.service = service
    }
}

extension RoomsViewModel: RoomsViewModelProtocol {
    /*
     this method connect calls rest API to get data
     */
    func getRoomsInfo() {
        
        let networkCient = NetworkClient(baseURL: EndPoints.roomsurl.rawValue, method: "get")
        service.fetchData(networkClient: networkCient, type: RoomInfo.self) { [weak self] (result) in
            switch result {
            case .success(let result):
                self?.roomsInfo = result
                DispatchQueue.main.async {
                    self?.delegate?.updateUI()
                }
            case .failure(_):
                self?.roomsInfo = nil
                DispatchQueue.main.async {
                    self?.delegate?.showError()
                }
            }
        }
    }
    
    func getRoomIdAndStatus(for row: Int) -> (id: String, status: Bool) {
        guard itemCount > row, row >= 0,  let roomInfo = roomsInfo?[row] else {
            return ("", false)
        }
        let roomId = roomInfo.id
        return (roomId, roomInfo.isOccupied)
    }
}
