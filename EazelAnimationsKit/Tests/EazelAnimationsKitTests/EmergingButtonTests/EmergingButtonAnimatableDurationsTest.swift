//
//  EmergingButtonAnimatableDurationsTest.swift
//  
//
//  Created by Yessen (eazel5) on 2022/07/28.
//

import XCTest
import UIKit
@testable import EazelAnimationsKit

class EmergingButtonAnimatableDurationsTest: XCTestCase {
    class TestEmergingButtonSetter: UIButton, EmergingButtonAnimatable {}
    
    func testPrepareAnimationsReturnTypeIsExpandAnimationDurationForExpandAnimationSlow() throws {
        let subButton = TestEmergingButtonSetter()
        let duration = subButton.prepareAnimation(for: .expandAnimation(isSelected: true, duration: .slow))
        XCTAssertTrue(duration is ExpandAnimationDuration)
    }
    
    func testPrepareAnimationsReturnTypeIsExpandAnimationDurationForExpandAnimationFast() throws {
        let subButton = TestEmergingButtonSetter()
        let duration = subButton.prepareAnimation(for: .expandAnimation(isSelected: true, duration: .fast))
        XCTAssertTrue(duration is ExpandAnimationDuration)
    }
    
    func testPrepareAnimationsReturnTypeIsFillUpAnimationDurationForFillUpAnimationSlow() throws {
        let subButton = TestEmergingButtonSetter()
        let duration = subButton.prepareAnimation(for: .fillUpAnimation(isSelected: true, duration: .slow))
        XCTAssertTrue(duration is FillUpAnimationDuration)
    }
    
    func testPrepareAnimationsReturnTypeIsFillUpAnimationDurationForFillUpAnimationFast() throws {
        let subButton = TestEmergingButtonSetter()
        let duration = subButton.prepareAnimation(for: .fillUpAnimation(isSelected: true, duration: .fast))
        XCTAssertTrue(duration is FillUpAnimationDuration)
    }
}
