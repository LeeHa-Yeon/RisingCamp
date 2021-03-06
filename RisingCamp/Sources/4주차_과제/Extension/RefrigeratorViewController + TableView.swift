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
        let target = ingredientList[indexPath.row]
        
        cell.ingredientNameLb.text = target.name
        cell.ingredientCntLb.text = String(target.cnt)
        cell.ingredientImg.image = UIImage(named: target.name)
        if selectSorted == 0 {
            cell.statusLb.text = ""
        }else if selectSorted == 1 {
            cell.statusLb.text = target.type
        } else {
            cell.statusLb.text = target.expiryDate
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete {
            firebase.deleteIngreient(key: ingredientList[indexPath.row].name)
            ingredientList.remove(at: indexPath.row)
            self.refrigertorManager.setIngredientInfo(ingredientList)
            
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectIndex = indexPath.row
        performSegue(withIdentifier: "segueDetail", sender: nil)
        
    }
}
