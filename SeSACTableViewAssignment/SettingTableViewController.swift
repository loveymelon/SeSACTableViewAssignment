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
        designSetLabel()
//        designTableView()
    }
    
    func designTableView() {
        self.tableView.separatorStyle = .singleLine
        self.tableView.separatorColor = .systemGray5
    }
    
    func designSetLabel() {
        self.setLabel.text = "설정"
        self.setLabel.textColor = .white
        self.setLabel.font = .boldSystemFont(ofSize: 18)
        self.setLabel.textAlignment = .center
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
