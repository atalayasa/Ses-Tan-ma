//
//  ButtonView.swift
//  Katip
//
//  Created by Atalay Aşa on 12/08/2017.
//  Copyright © 2017 Atalay Asa. All rights reserved.
//
import UIKit

import UIKit
@IBDesignable
class RoundButton: UIButton {
    
    @IBInspectable var cornerRadius: CGFloat = 30.0 {
        didSet{//Alltakiyle aynı işi yapıyor.
            //layer.cornerRadius = cornerRadius
            setupView()
        }
    }
    //    required init?(coder aDecoder: NSCoder) { //Her bir karenin yuvarlak corner radius kazanması için
    //        super.init(coder: aDecoder)
    //        layer.cornerRadius = 30.0
    //    }
    
    
    override func prepareForInterfaceBuilder() {
        setupView()
    }
    
    func setupView() {
        layer.cornerRadius = cornerRadius
    }
    
    
    
}

