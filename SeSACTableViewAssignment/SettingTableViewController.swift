//
//  SettingTableViewController.swift
//  SeSACTableViewAssignment
//
//  Created by 김진수 on 1/5/24.
//

import UIKit

class SettingTableViewController: UITableViewController {

    @IBOutlet var setLabel: UILabel!
    
    let sectionHead = ["전체 설정", "개인 설정", "기타"]
    let oneSectionList = ["공지사항", "실험심", "버전 정보"]
    let twoSectionList = ["개인/보안", "알림", "채팅", "멀티프로필"]
    let thirdSectionList = ["고객센터/도움말"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configuarLabel()
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return oneSectionList.count
        } else if section == 1 {
            return twoSectionList.count
        } else {
            return thirdSectionList.count
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SettingTableViewCell", for: indexPath) as! SettingTableViewCell
        
        if indexPath.section == 0 {
            cell.settingLabel.text = oneSectionList[indexPath.row]
        } else if indexPath.section == 1{
            cell.settingLabel.text = twoSectionList[indexPath.row]
        } else {
            cell.settingLabel.text = thirdSectionList[indexPath.row]
        }
        
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sectionHead[section]
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    override func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        let header = view as! UITableViewHeaderFooterView
        header.textLabel?.font = .systemFont(ofSize: 15)
    }
   

}

// ShoppingTableViewController와 SettingTableViewController에서 label을 설정할때 공통적으로 설정을 하는 부분이 있어서 extension으로 따로 파일을 만들어서 뺐습니다.
// ShoppingTableViewController와 SettingTableViewController에서 공통적으로 label을 설정하는 함수가 있어 protocol로도 뺐습니다.
extension SettingTableViewController: ConfiguarUI {
    func configuarLabel() {
        self.setLabel.setBodyLabel(text: "설정", color: .white, fontValue: 18, alignment: .center)
    }
    
}
