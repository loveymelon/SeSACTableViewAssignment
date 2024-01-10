//
//  UILabel+Extension.swift
//  SeSACTableViewAssignment
//
//  Created by 김진수 on 1/10/24.
//

import Foundation
import UIKit

extension UILabel {
    func setBodyLabel(text: String, color: UIColor = .black, fontValue: CGFloat, alignment: NSTextAlignment) {
        self.text = text
        self.textColor = color
        self.font = .systemFont(ofSize: fontValue)
        self.textAlignment = alignment
    }
}
