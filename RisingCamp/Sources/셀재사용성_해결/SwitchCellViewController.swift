//
//  SwitchCellViewController.swift
//  RisingCamp
//
//  Created by 이하연 on 2021/11/21.
//

import UIKit

class SwitchCellViewController: UIViewController {
    
    var dummyData: [String] = ["1","2","3","4","5","6","7","8","9","10","11","12","13","14","15","16","17","18","19","20","21","22","23","24","25","1","2","3","4","5","6","7","8","9","10","11","12","13","14","15","16","17","18","19","20","21","22","23","24","25"]
    var switchStatus = [Bool]()
    
    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        for _ in 0..<dummyData.count{
            switchStatus.append(false)
        }
    }
    
    func setupTableView(){
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    @objc func switchChange(_ sender: UISwitch){
        switchStatus[sender.tag] = !switchStatus[sender.tag]
    }
    
}

extension SwitchCellViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dummyData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "switchCell", for: indexPath) as? SwitchCell else {
            return UITableViewCell()
        }
        cell.myLb.text = dummyData[indexPath.row]
        cell.mySwitch.tag = indexPath.row
        cell.mySwitch.addTarget(self, action: #selector(switchChange(_:)), for: .valueChanged )
        cell.mySwitch.isOn = switchStatus[indexPath.row]
        return cell
    }
    
}

class SwitchCell: UITableViewCell {
    
    @IBOutlet weak var myLb: UILabel!
    @IBOutlet weak var mySwitch: UISwitch!
    
}
