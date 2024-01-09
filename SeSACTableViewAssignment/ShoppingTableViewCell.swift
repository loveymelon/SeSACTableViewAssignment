//
//  ShoppingTableViewCell.swift
//  SeSACTableViewAssignment
//
//  Created by 김진수 on 1/5/24.
//

import UIKit

class ShoppingTableViewCell: UITableViewCell {

    @IBOutlet var checkButton: UIButton!
    @IBOutlet var itemLabel: UILabel!
    @IBOutlet var shoppingView: UIView!
    @IBOutlet var starButton: UIButton!
    
    func settingCell(data: Shop, index: Int) {
        let checkImage = !data.checkBoxTodo ? "checkmark.square" : "checkmark.square.fill"
        let startImage = !data.starBoxTodo ? "star" : "star.fill"
        
        self.checkButton.setImage(UIImage(systemName: checkImage), for: .normal)
        self.starButton.setImage(UIImage(systemName: startImage), for: .normal)
        
        self.starButton.tag = index
        self.checkButton.tag = index
    }
}
