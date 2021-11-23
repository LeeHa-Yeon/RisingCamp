//
//  SettingViewController.swift
//  RisingCamp
//
//  Created by 이하연 on 2021/11/23.
//

import UIKit

class SettingViewController: UIViewController {
    
    //MARK: - Components

    @IBOutlet weak var tableView: UITableView!

    
    
    //MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setTableView()
    }
    
    //MARK: - Functions
    
    func setTableView(){
        tableView.dataSource = self
        tableView.delegate = self
    }
    
}
