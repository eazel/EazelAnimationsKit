//
//  File.swift
//  
//
//  Created by Yessen (eazel5) on 2022/07/28.
//

import UIKit

public class PreEmergingButton: UIButton, PreEmergedButton {
    
    var imageForNormalState: UIImage?
    var imageForSelectedState: UIImage?
    var imageContentMode: UIView.ContentMode
    
    public init(frame: CGRect = .zero,
         unselectedImage: UIImage? = nil,
         selectedImage: UIImage? = nil,
                contentMode: UIView.ContentMode = .scaleAspectFit) {
        self.imageForNormalState = unselectedImage
        self.imageForSelectedState = selectedImage
        self.imageContentMode = contentMode
        
        super.init(frame: frame)
        
        self.setImages()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
