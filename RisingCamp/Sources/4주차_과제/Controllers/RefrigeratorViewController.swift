//
//  RefrigeratorViewController.swift
//  RisingCamp
//
//  Created by 이하연 on 2021/11/17.
//

import UIKit

class RefrigeratorViewController: UIViewController {
    
    let firebase = FirebaseManager.shared
    let refrigertorManager = Refrigerator.shared
    
    var ingredientList = [Ingredient]()
    
    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)

        firebase.loadRefrigerator { response in
            self.ingredientList = response
            self.refrigertorManager.setIngredientInfo(response)
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    func setupTableView(){
        tableView.dataSource = self
        tableView.delegate = self
    }
    
}



