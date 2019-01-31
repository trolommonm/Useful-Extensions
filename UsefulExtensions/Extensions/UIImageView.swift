//
//  UIImageView.swift
//  YogaMovementTablet
//
//  Created by Alvin on 17/1/19.
//  Copyright © 2019 Alvin. All rights reserved.
//

import UIKit

let imageCache = NSCache<AnyObject, AnyObject>()

extension UIImageView {
    
    func setImage(urlString: String, defaultImage: UIImage? = nil) {
        guard let url = URL(string: urlString) else {
            print("nil url?")
            image = defaultImage
            return
        }
        
        if let imageFromCache = imageCache.object(forKey: urlString as AnyObject) as? UIImage {
            image = imageFromCache
            return
        }
        
        URLSession.shared.dataTask(with: url, completionHandler: { [weak self]data, response, error in
            if let error = error {
                DispatchQueue.main.async {
                    self?.image = defaultImage
                }
                print(error)
            } else if let data = data, let response = response as? HTTPURLResponse, response.statusCode == 200 {
                if let downloadedImage = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = downloadedImage
                    }
                    imageCache.setObject(downloadedImage, forKey: urlString as AnyObject)
                } else {
                    DispatchQueue.main.async {
                        self?.image = defaultImage
                    }
                }
            } else {
                DispatchQueue.main.async {
                    self?.image = defaultImage
                }
            }
        }).resume()
    }
    
}
