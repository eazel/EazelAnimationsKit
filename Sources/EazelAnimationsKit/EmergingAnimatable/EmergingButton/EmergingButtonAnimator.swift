//
//  EmergingButtonAnimations.swift
//  
//
//  Created by Yessen (eazel5) on 2022/07/28.
//

import UIKit

protocol EmergingButtonAnimator: UIButton {
    func animateWithExpansion(isButtonSelected: Bool, duration: ExpandAnimationDuration)
    func animateWithFillUp(isButtonSelected: Bool, duration: FillUpAnimationDuration)
}

extension EmergingButtonAnimator {
    func animateWithExpansion(isButtonSelected: Bool, duration: ExpandAnimationDuration) {
        DispatchQueue.main.async {
            guard self == self else { return }
            UIView.animate(withDuration: duration.startAnimation, animations: {
                self.transform = (self.transform.scaledBy(x: 0.1, y: 0.1))
            }, completion: { _ in
                guard self == self else { return }
                UIView.animate(withDuration: duration.finishAnimation, animations: {
                    self.isSelected = isButtonSelected
                    self.transform = CGAffineTransform.identity
                })
            })
        }
    }
    
    func animateWithFillUp(isButtonSelected: Bool, duration: FillUpAnimationDuration) {
        let buttonState: UIControl.State = isButtonSelected
        ? .selected
        : .normal
        
        let overlappingImageView = self.getOverlappingImage(for: buttonState)
        self.animateWithFillUp(with: overlappingImageView, isSelected: isButtonSelected, duration: duration)
    }
    
    private func animateWithFillUp(with overlappingImage: UIImageView, isSelected: Bool, duration: FillUpAnimationDuration) {
        self.addSubview(overlappingImage)
        
        overlappingImage.frame = self.bounds
        overlappingImage.transform = overlappingImage.transform.scaledBy(x: 0.2, y: 0.2)
        
        DispatchQueue.main.async {
            UIView.animate(withDuration: duration.startAnimation, delay: 0.09, options: .curveEaseIn, animations: {
                overlappingImage.transform = CGAffineTransform.identity
            }, completion: { _ in
                guard self == self else { return }
                UIView.animate(withDuration: duration.finishAnimation) {
                    self.isSelected = isSelected
                    overlappingImage.removeFromSuperview()
                }
            })
        }
    }
    
    func getOverlappingImage(for buttonState: UIControl.State) -> UIImageView {
        let overlappingImage = self.image(for: buttonState)
        let overlappingImageView: UIImageView = UIImageView(image: overlappingImage)
        
        return overlappingImageView
    }
}
