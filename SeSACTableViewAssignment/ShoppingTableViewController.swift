//
//  ShoppingTableViewController.swift
//  SeSACTableViewAssignment
//
//  Created by 김진수 on 1/5/24.
//

import UIKit

struct Shop: Codable {
    let productName: String
    var checkBoxTodo: Bool
    var starBoxTodo: Bool
}

class ShoppingTableViewController: UITableViewController {
    
    @IBOutlet var shoppingLabel: UILabel!
    @IBOutlet var plusTextField: UITextField!
    @IBOutlet var plusButton: UIButton!
    @IBOutlet var resetButton: UIButton!
//    ["그립톡 구매하기", "사이다 구매", "아이패드 케이스 최저가 알아보기", "양말"]
    
    var shoppingList: [Shop] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setShoppingList()
        
        designUI()
        designButton(button: plusButton, text: "추가")
        designButton(button: resetButton, text: "초기화")
        
        print(UserDefaultsManager.shopList)
    }
    
    func setShoppingList() {
        self.shoppingList = UserDefaultsManager.shopList ?? [Shop(productName: "그립톡 구매하기", checkBoxTodo: false, starBoxTodo: false),
                                                             Shop(productName: "사이다 구매", checkBoxTodo: false, starBoxTodo: false),
                                                             Shop(productName: "아이패드 케이스 최저가 알아보기", checkBoxTodo: false, starBoxTodo: false),
                                                             Shop(productName: "양말", checkBoxTodo: false, starBoxTodo: false)]
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
        
        let checkImage = !shoppingList[indexPath.row].checkBoxTodo ? "checkmark.square" : "checkmark.square.fill"
        let starImage = !shoppingList[indexPath.row].starBoxTodo ? "star" : "star.fill"
        
        cell.checkButton.setImage(UIImage(systemName: checkImage), for: .normal)
        cell.starButton.setImage(UIImage(systemName: starImage), for: .normal)
        
        cell.starButton.tag = indexPath.row
        cell.checkButton.tag = indexPath.row
    
        cell.checkButton.tintColor = .black
        cell.starButton.tintColor = .black
        cell.itemLabel.text = shoppingList[indexPath.row].productName
        
        cell.shoppingView.backgroundColor = .systemGray5
        cell.shoppingView.layer.cornerRadius = 10
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    @IBAction func tappedPlusButton(_ sender: UIButton) {
        
        shoppingList.append(Shop(productName: plusTextField.text!, checkBoxTodo: false, starBoxTodo: false))
        
        UserDefaultsManager.shopList = shoppingList
        
        print(UserDefaultsManager.shopList)
        
        self.tableView.reloadData()
    }
    
    
    @IBAction func tappedButton(_ sender: UIButton) {
        let buttonId = (sender.imageView?.image == UIImage(systemName: "checkmark.square")) || (sender.imageView?.image == UIImage(systemName: "checkmark.square.fill")) ? "checkButton" : "startButton"
        
        buttonId == "checkButton" ? shoppingList[sender.tag].checkBoxTodo.toggle() : shoppingList[sender.tag].starBoxTodo.toggle()
        
        self.tableView.reloadRows(at: [IndexPath(row: sender.tag, section: 0)], with: .fade)
        print(shoppingList)
    }
    
    @IBAction func tappedResetButton(_ sender: UIButton) {
        /*if self.shoppingList.count > 4 {
            while shoppingList.count != 4 {
                shoppingList.remove(at: 4)
            }
        }*/
        self.shoppingList = [Shop(productName: "그립톡 구매하기", checkBoxTodo: false, starBoxTodo: false),
                             Shop(productName: "사이다 구매", checkBoxTodo: false, starBoxTodo: false),
                             Shop(productName: "아이패드 케이스 최저가 알아보기", checkBoxTodo: false, starBoxTodo: false),
                             Shop(productName: "양말", checkBoxTodo: false, starBoxTodo: false)]
        
        UserDefaults.standard.removeObject(forKey: "Shop")
        
        print(UserDefaultsManager.shopList)
        
        self.tableView.reloadData()
    }
}
