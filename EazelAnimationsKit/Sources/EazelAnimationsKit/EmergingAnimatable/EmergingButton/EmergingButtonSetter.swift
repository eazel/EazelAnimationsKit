//
//  EmergingButtonSetter.swift
//  
//
//  Created by Yessen (eazel5) on 2022/07/28.
//

import UIKit

protocol EmergingButtonSetter: UIButton {
    var imageForNormalState: UIImage? { get set }
    var imageForSelectedState: UIImage? { get set }
    
    func setImages()
}

extension EmergingButtonSetter {
    func setImages() {
        self.setImage(imageForNormalState, for: .normal)
        self.setImage(imageForSelectedState, for: .selected)
        self.setImage(imageForSelectedState, for: UIControl.State(rawValue: 5))
        
        self.imageView?.contentMode = .scaleToFill
    }
}
