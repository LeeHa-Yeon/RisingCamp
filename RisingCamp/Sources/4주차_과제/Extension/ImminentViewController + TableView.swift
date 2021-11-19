//
//  ImminentViewController + TableView.swift
//  RisingCamp
//
//  Created by 이하연 on 2021/11/18.
//

import Foundation
import UIKit

extension ImminentViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return imminentList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "expiryDateCell", for: indexPath) as? ExpiryDateTableViewCell else {
            return UITableViewCell()
        }
        let target = imminentList[indexPath.row]
        cell.ingredientImg.image = UIImage(named: target["name"]!)
        cell.ingredientName.text = target["name"]
        cell.statusLb.text = "임박! \(target["dDay"]!)일 남음"
        cell.statusLb.textColor = #colorLiteral(red: 1, green: 0, blue: 0, alpha: 1)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }

}
