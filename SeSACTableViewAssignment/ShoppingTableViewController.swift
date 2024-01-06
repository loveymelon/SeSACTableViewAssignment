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
    @IBOutlet var resetButton: UIButton!
    
    var shoppingList = UserDefaults.standard.array(forKey: "ShoppingList") as? [String] ?? ["그립톡 구매하기", "사이다 구매", "아이패드 케이스 최저가 알아보기", "양말"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        designUI()
        designButton(button: plusButton, text: "추가")
        designButton(button: resetButton, text: "초기화")
    }
    
    func designUI() {
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
    
    func designButton(button: UIButton, text: String) {
        button.setTitle(text, for: .normal)
        button.backgroundColor = .systemGray3
        button.layer.cornerRadius = 5
        button.setTitleColor(.black, for: .normal)
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
    
    @IBAction func tappedPlusButton(_ sender: UIButton) {
        shoppingList.append(plusTextField.text ?? "없음")
        
        UserDefaults.standard.set(shoppingList, forKey: "ShoppingList")
        
        self.tableView.reloadData()
    }
    
    
    @IBAction func tappedButton(_ sender: UIButton) {
        sender.isSelected.toggle()
    }
    
    @IBAction func tappedResetButton(_ sender: UIButton) {
        if self.shoppingList.count > 4 {
            while shoppingList.count != 4 {
                shoppingList.remove(at: 4)
            }
        }
        
        UserDefaults.standard.removeObject(forKey: "ShoppingList")
        
        self.tableView.reloadData()
    }
}
