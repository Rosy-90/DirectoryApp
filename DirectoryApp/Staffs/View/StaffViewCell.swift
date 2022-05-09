//
//  StaffViewCell.swift
//  DirectoryApp
//
//  Created by Rosy Patel on 09/05/2022.
//

import UIKit

class StaffViewCell: UICollectionViewCell {
    
    @IBOutlet weak var staffImageView: UIImageView!
    @IBOutlet weak var firstName: UILabel!
    
    func setData(staffDetails:(imageName: String, firstName: String)) {
        firstName.text = staffDetails.firstName
        setStaffImage(imageName: staffDetails.imageName)
    }
    
    func setStaffImage(imageName: String) {
        let url = URL(string: imageName)
        downloadStaffsImages(imageURL: url)
        
    }
    
    func downloadStaffsImages(imageURL: URL?) {
        let imageCache = NSCache<AnyObject, AnyObject>.sharedInstance
        let downloadTask: URLSessionDownloadTask?
        
        if let urlOfImage = imageURL {
            if let cachedImage = imageCache.object(forKey: urlOfImage.absoluteString as NSString) {
                self.staffImageView.image = cachedImage as? UIImage
            } else {
                let session = URLSession.shared
                downloadTask = session.downloadTask(
                    with: urlOfImage as URL, completionHandler: { [weak self] url, response, error in
                        if error == nil, let url = url, let data = NSData(contentsOf: url), let image = UIImage(data: data as Data) {
                            
                            DispatchQueue.main.async() {
                                let imageToCache = image
                                if let self = self, let imageView = self.staffImageView {
                                    imageView.image = imageToCache
                                    imageCache.setObject(imageToCache, forKey: urlOfImage.absoluteString as NSString , cost: 1)
                                }
                            }
                        } else {
                            print("ERROR \(String(describing: error?.localizedDescription))")
                        }
                    })
                downloadTask!.resume()
            }
        }
    }
}

extension NSCache {
    @objc class var sharedInstance: NSCache<NSString, AnyObject> {
        let cache = NSCache<NSString, AnyObject>()
        return cache
    }
}

