//
//  DropShadowView.swift
//  TestExample
//
//  Created by Pawel Trojan on 06.06.2017.
//  Copyright © 2017 ptrojan. All rights reserved.
//

import UIKit

@IBDesignable
class DropShadowView: UIView {

    @IBInspectable var shadowOffset: CGSize = CGSize(width: 0, height: 0)
    @IBInspectable var shadowOpacity: Float = 0
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.setUpShadow()
    }
    
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        self.setUpShadow()
    }
    
    private func setUpShadow() {
        self.layer.shadowOffset = self.shadowOffset
        self.layer.shadowOpacity = self.shadowOpacity
    }
    
}
