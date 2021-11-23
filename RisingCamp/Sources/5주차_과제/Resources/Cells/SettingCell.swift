//
//  SettingCell.swift
//  RisingCamp
//
//  Created by 이하연 on 2021/11/23.
//

import Foundation
import UIKit

class SettingCell: UITableViewCell {
    
    //MARK: - Components
    
    @IBOutlet weak var testSwitch: UISwitch!
    @IBAction func switchAction(_ sender: UISwitch) {
        UserDefaults.standard.set(testSwitch.isOn, forKey: "switchState")
    }
    
    //MARK: - Cell LifeCycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setSetting()
    }
    
    //MARK: - Functions
    
    func setSetting(){
        testSwitch.isOn = UserDefaults.standard.bool(forKey: "switchState")
    }
    
    
}
