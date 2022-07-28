//
//  EmergingAnimatable.swift
//  
//
//  Created by Yessen (eazel5) on 2022/07/28.
//

import Foundation

public protocol EmergingAnimatable {
    associatedtype AnimationConfig
    
    func animate(with config: AnimationConfig)
}
