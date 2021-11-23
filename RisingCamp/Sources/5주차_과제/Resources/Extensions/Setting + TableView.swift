//
//  Setting + TableView.swift
//  RisingCamp
//
//  Created by 이하연 on 2021/11/23.
//

import UIKit

extension SettingViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "settingCell", for: indexPath) as? SettingCell else {
            return UITableViewCell()
        }
        return cell
    }
    
}
