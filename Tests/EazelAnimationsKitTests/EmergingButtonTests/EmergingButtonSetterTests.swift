//
//  EmergingButtonSetterTests.swift
//  
//
//  Created by Yessen (eazel5) on 2022/07/28.
//

import XCTest
import UIKit
@testable import EazelAnimationsKit

class EmergingButtonSetterTests: XCTestCase {
    class TestEmergingButtonSetter: UIButton, EmergingButtonSetter {
        var imageContentMode: UIView.ContentMode
        var imageForNormalState: UIImage?
        var imageForSelectedState: UIImage?
        
        init(selectedImage: UIImage?, unselectedImage: UIImage?, contentMode: UIView.ContentMode) {
            self.imageForNormalState = unselectedImage
            self.imageForSelectedState = selectedImage
            self.imageContentMode = contentMode
            super.init(frame: .zero)
        }
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
    }
    
    func testEmergingButtonSetterNormalImageNil() throws {
        let sut = TestEmergingButtonSetter(selectedImage: UIImage(named: "not real"), unselectedImage: UIImage(named: "not real"), contentMode: .scaleAspectFit)
        sut.setImages()
        let normalStateImage = sut.image(for: .normal)
        XCTAssertNil(normalStateImage)
    }
    
    func testEmergingButtonSetterSelectedImageNil() throws {
        let sut = TestEmergingButtonSetter(selectedImage: UIImage(named: "not real"), unselectedImage: UIImage(named: "not real"), contentMode: .scaleAspectFit)
        sut.setImages()
        let selectedStateImage = sut.image(for: .selected)
        XCTAssertNil(selectedStateImage)
    }
    
    func testEmergingButtonSetterSelectedImageNotNil() throws {
        let sut = TestEmergingButtonSetter(selectedImage: UIImage(named: "flower_on", in: .module, compatibleWith: nil), unselectedImage: UIImage(named: "flower_on"), contentMode: .scaleAspectFit)
        sut.setImages()
        let selectedStateImage = sut.image(for: .selected)
        XCTAssertNotNil(selectedStateImage)
    }
    func testEmergingButtonSetterNormalImageNotNil() throws {
        let sut = TestEmergingButtonSetter(selectedImage: UIImage.getImage(named: "flower_on"), unselectedImage: UIImage.getImage(named: "flower_off"), contentMode: .scaleAspectFit)
        sut.setImages()
        let normalStateImage = sut.image(for: .normal)
        XCTAssertNotNil(normalStateImage)
    }
}

extension UIImage {
    static func getImage(named: String) -> UIImage? {
        return UIImage(named: named, in: .module, compatibleWith: nil)
    }
}
