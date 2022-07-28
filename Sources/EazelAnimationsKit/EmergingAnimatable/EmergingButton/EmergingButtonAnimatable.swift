//
//  EmergingButtonAnimator.swift
//  
//
//  Created by Yessen (eazel5) on 2022/07/28.
//

import UIKit

protocol EmergingButtonAnimatable: ButtonEmergible where AnimationConfig == ButtonAnimatorConfig { }

enum ButtonAnimatorConfig {
    case expandAnimation(isSelected: Bool, duration: ButtonAnimatingSpeed)
    case fillUpAnimation(isSelected: Bool, duration: ButtonAnimatingSpeed)
}

enum ButtonAnimatingSpeed {
    case fast
    case slow
}

extension EmergingButtonAnimatable {
    func animate(with config: AnimationConfig) {
        switch config {
        case .expandAnimation(let isSelected, _):
            guard let expandAnimationDuration = self.prepareAnimation(for: config) as? ExpandAnimationDuration else { return }
            self.animateWithExpansion(isButtonSelected: isSelected, duration: expandAnimationDuration)
        case .fillUpAnimation(let isSelected, _):
            guard let fillUpAnimationDuration = self.prepareAnimation(for: config) as? FillUpAnimationDuration else { return }
            self.animateWithFillUp(isButtonSelected: isSelected, duration: fillUpAnimationDuration)
        }
    }
    
    func prepareAnimation(for type: ButtonAnimatorConfig) -> EmergingButtonDuration {
        switch type {
        case .expandAnimation(_, let duration):
            switch duration {
            case .fast:
                return ExpandAnimationDuration(startAnimation: 0.01, finishAnimation: 0.1)
            case .slow:
                return ExpandAnimationDuration(startAnimation: 0.1, finishAnimation: 1.0)
            }
        case .fillUpAnimation(_, let duration):
            switch duration {
            case .fast:
                return FillUpAnimationDuration(startAnimation: 0.2, finishAnimation: 0.1)
            case .slow:
                return FillUpAnimationDuration(startAnimation: 1.2, finishAnimation: 1.1)
            }
        }
    }
}
