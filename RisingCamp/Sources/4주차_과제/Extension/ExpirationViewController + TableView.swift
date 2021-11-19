//
//  ExpirationViewController + TableView.swift
//  RisingCamp
//
//  Created by 이하연 on 2021/11/18.
//

import Foundation
import UIKit

extension ExpirationViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return expirationList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "expiryDateCell", for: indexPath) as? ExpiryDateTableViewCell else {
            return UITableViewCell()
        }
        
        let target = expirationList[indexPath.row]
        cell.ingredientImg.image = UIImage(named: target)
        cell.ingredientName.text = target
        cell.statusLb.text = "만료!"
        cell.statusLb.textColor = #colorLiteral(red: 0.6486477852, green: 0.1892060041, blue: 1, alpha: 1)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }

}
