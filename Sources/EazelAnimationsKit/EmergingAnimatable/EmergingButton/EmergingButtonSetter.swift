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
    var imageContentMode: UIView.ContentMode { get set }
    
    func setImages()
}


// Here we set the images for particular EmergingButton states.
// When user taps on button, it will move to .selected, and back to .normal on second tap.
// However, when the button goes from .selected to .normal state, there is a super quick state UIControl.State(rawValue: 5),
// which causes weird animation.
// In this case, if we do not specify image for that, as it is nil by default, it will move to image from .normal state.
// Therefore, we had to specify explicitly what image we want to put for rawValue: 5, which is image for .selected state.
// We tried to do some research about what is that state for, but unfortunately could not. Therefore, if there are any
// other workarounds with this issue, please open PR!
 

extension EmergingButtonSetter {
    func setImages() {
        self.setImage(imageForNormalState, for: .normal)
        self.setImage(imageForSelectedState, for: .selected)
        self.setImage(imageForSelectedState, for: UIControl.State(rawValue: 5))
        
        self.imageView?.contentMode = self.imageContentMode
    }
}
