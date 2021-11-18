//
//  RefrigeratorViewController + TableView.swift
//  RisingCamp
//
//  Created by 이하연 on 2021/11/18.
//

import Foundation
import UIKit

extension RefrigeratorViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ingredientList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "refrigeratorCell", for: indexPath) as? RefrigeratorCell else {
            return UITableViewCell()
        }
        cell.ingredientNameLb.text = ingredientList[indexPath.row].name
        cell.ingredientCntLb.text = String(ingredientList[indexPath.row].cnt)
        cell.ingredientImg.image = UIImage(named: ingredientList[indexPath.row].name)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    
}
