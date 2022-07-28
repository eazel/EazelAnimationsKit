//
//  File.swift
//  
//
//  Created by Yessen (eazel5) on 2022/07/28.
//

import UIKit

protocol PreEmergingButtonAnimatable: ButtonPreEmergible where AnimationConfig == PreEmergingButtonAnimatorConfig { }

public enum PreEmergingButtonAnimatorConfig {
    case expandAnimation(isSelected: Bool, duration: PreEmergingButtonDuration)
    case fillUpAnimation(isSelected: Bool, duration: PreEmergingButtonDuration)
}

public struct PreEmergingButtonDuration {
    let startAnimating: TimeInterval
    let finishAnimating: TimeInterval
}

extension PreEmergingButtonAnimatable {
    public func animate(with config: AnimationConfig) {
        switch config {
        case .expandAnimation(isSelected: let isSelected, duration: let duration):
            let expandAnimationDuration = ExpandAnimationDuration(startAnimation: duration.startAnimating, finishAnimation: duration.finishAnimating)
            self.animateWithExpansion(isButtonSelected: isSelected, duration: expandAnimationDuration)
        case .fillUpAnimation(isSelected: let isSelected, duration: let duration):
            let fillUpAnimatioNDuration = FillUpAnimationDuration(startAnimation: duration.startAnimating, finishAnimation: duration.finishAnimating)
            self.animateWithFillUp(isButtonSelected: isSelected, duration: fillUpAnimatioNDuration)
        }
    }
}
