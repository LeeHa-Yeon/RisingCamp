//
//  LifeCycleViewController.swift
//  RisingCamp
//
//  Created by 이하연 on 2021/10/30.
//

import UIKit

class LifeCycleViewController: UIViewController {
    
    @IBOutlet weak var label: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        // 노티피케이션 -> 파일로 묶어서 관리하면 좋을듯 Notification.Name -> 이게 노티피케이션이름
        NotificationCenter.default.addObserver(self, selector: #selector(testNoti), name: Notification.Name("testNoti_name"), object: nil)
    }
    @objc func testNoti(){
        label.text = "노티피케이션 테스트 성공"
    }
    
}

