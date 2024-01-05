//
//  ShoppingTableViewController.swift
//  SeSACTableViewAssignment
//
//  Created by 김진수 on 1/5/24.
//

import UIKit

class ShoppingTableViewController: UITableViewController {
    
    @IBOutlet var shoppingLabel: UILabel!
    @IBOutlet var plusTextField: UITextField!
    @IBOutlet var plusButton: UIButton!
    
    var shoppingList = ["그립톡 구매하기", "사이다 구매", "아이패드 케이스 최저가 알아보기", "양말"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        designUI()
    }
    
    func designUI() {
        designPlusButton()
        designShoppingLabel()
        designPlusTextField()
    }
    
    func designShoppingLabel() {
        self.shoppingLabel.text = "쇼핑"
        self.shoppingLabel.font = .boldSystemFont(ofSize: 24)
        self.shoppingLabel.textAlignment = .center
    }
    
    func designPlusTextField() {
        self.plusTextField.placeholder = "무엇을 구매하실 건가요?"
        self.plusTextField.backgroundColor = .systemGray5
    }
    
    func designPlusButton() {
        self.plusButton.setTitle("추가", for: .normal)
        self.plusButton.backgroundColor = .systemGray3
        self.plusButton.layer.cornerRadius = 5
        self.plusButton.setTitleColor(.black, for: .normal)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return shoppingList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ShoppingTableViewCell", for: indexPath) as! ShoppingTableViewCell
        
        cell.checkButton.setImage(UIImage(systemName: "checkmark.square"), for: .normal)
        cell.checkButton.setImage(UIImage(systemName: "checkmark.square.fill"), for: .selected)
        cell.starButton.setImage(UIImage(systemName: "star"), for: .normal)
        cell.starButton.setImage(UIImage(systemName: "star.fill"), for: .selected)
    
        cell.checkButton.tintColor = .black
        cell.starButton.tintColor = .black
        cell.itemLabel.text = shoppingList[indexPath.row]
        
        cell.shoppingView.backgroundColor = .systemGray5
        cell.shoppingView.layer.cornerRadius = 10
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    @IBAction func tappedButton(_ sender: UIButton) {
        shoppingList.append(plusTextField.text ?? "없음")
        
        self.tableView.reloadData()
    }
    
    @IBAction func tappedShoppingButton(_ sender: UIButton) {
        sender.isSelected.toggle()
        
        if sender.isSelected {
            sender
        }
    }
    
}
