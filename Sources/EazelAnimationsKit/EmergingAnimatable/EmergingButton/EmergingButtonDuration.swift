//
//  EmergingButtonDuration.swift
//  
//
//  Created by Yessen (eazel5) on 2022/07/28.
//

import UIKit

protocol EmergingButtonDuration {
    var startAnimation: TimeInterval { get set }
    var finishAnimation: TimeInterval { get set }
}

struct ExpandAnimationDuration: EmergingButtonDuration {
    var startAnimation: TimeInterval
    var finishAnimation: TimeInterval
}

struct FillUpAnimationDuration: EmergingButtonDuration {
    var startAnimation: TimeInterval
    var finishAnimation: TimeInterval
}

