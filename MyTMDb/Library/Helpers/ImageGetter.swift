//
//  ImageGetter.swift
//  MyTMDb
//
//  Created by José Victor Pereira Costa on 15/01/19.
//  Copyright © 2019 José Victor Pereira Costa. All rights reserved.
//

import Foundation
import UIKit

class ImageGetter {
    static func getImage(with path: String) -> UIImage {
        let url = URL(string: AppEnvironment.baseImagesURL + path)
        let data = try? Data(contentsOf: url!)
        
        if let imageData = data, let image = UIImage(data: imageData) {
            return image
        }
        
        return UIImage()
    }

}
