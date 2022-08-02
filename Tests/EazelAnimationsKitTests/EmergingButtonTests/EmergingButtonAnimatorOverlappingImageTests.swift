//
//  EmergingButtonAnimatorOverlappingImageTests.swift
//  
//
//  Created by Yessen (eazel5) on 2022/07/28.
//

import XCTest
import UIKit
@testable import EazelAnimationsKit

class EmergingButtonAnimatorOverlappingImageTests: XCTestCase {
    class TestEmergingButtonAnimatorButton: UIButton, EmergedButton {
        var imageContentMode: UIView.ContentMode
        
        var imageForNormalState: UIImage?
        var imageForSelectedState: UIImage?
        
        init(selectedImage: UIImage?, unselectedImage: UIImage?, contentMode: UIView.ContentMode) {
            self.imageForNormalState = unselectedImage
            self.imageForSelectedState = selectedImage
            self.imageContentMode = contentMode
            
            super.init(frame: .zero)
            
            self.setImages()
        }
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
    }
    
    func testOverlappingImageReturnsSelectedImage() throws {
        let set = TestEmergingButtonAnimatorButton(selectedImage: UIImage.getImage(named: "flower_on"), unselectedImage: UIImage.getImage(named: "flower_off"),
                                                   contentMode: .scaleAspectFit)
        let selectedImageToOverlap = set.getOverlappingImage(for: .selected)
        XCTAssertTrue(selectedImageToOverlap.image == set.image(for: .selected))
    }
    
    func testOverlappingImageReturnsUnselectedImage() throws {
        let set = TestEmergingButtonAnimatorButton(selectedImage: UIImage.getImage(named: "flower_on"), unselectedImage: UIImage.getImage(named: "flower_off"),contentMode: .scaleAspectFit)
        let selectedImageToOverlap = set.getOverlappingImage(for: .normal)
        XCTAssertTrue(selectedImageToOverlap.image == set.image(for: .normal))
    }
}
