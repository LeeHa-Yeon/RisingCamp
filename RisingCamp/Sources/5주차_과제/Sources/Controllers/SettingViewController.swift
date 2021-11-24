//
//  SettingViewController.swift
//  RisingCamp
//
//  Created by 이하연 on 2021/11/23.
//

import UIKit

class SettingViewController: UIViewController {
    
    //MEMO: - 데이터를 영구적으로 저장하는 방법 (UserDefault)

    
    //MARK: - Components
    @IBOutlet weak var darkModeSwitch: UISwitch!
    @IBAction func darkModeAction(_ sender: UISwitch) {
        UserDefaults.standard.set(darkModeSwitch.isOn, forKey: "darkState")
        darkMode()
    }

    @IBAction func backBtn(_ sender: UIButton){
        self.dismiss(animated: true, completion: nil)
    }

    
    //MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setSetting()
        darkMode()
    }
    
    //MARK: - Functions
    
    func setSetting(){
        darkModeSwitch.isOn = UserDefaults.standard.bool(forKey: "darkState")
    }
    
    func darkMode(){
        let isDarkMode: Bool = UserDefaults.standard.bool(forKey: "darkState")
        if isDarkMode {
            overrideUserInterfaceStyle = .dark
        }else {
            overrideUserInterfaceStyle = .light
        }
    }
    
    
}


