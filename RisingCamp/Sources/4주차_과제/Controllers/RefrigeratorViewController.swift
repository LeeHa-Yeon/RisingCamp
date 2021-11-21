//
//  RefrigeratorViewController.swift
//  RisingCamp
//
//  Created by 이하연 on 2021/11/17.
//

import UIKit

class RefrigeratorViewController: UIViewController {
    
    var selectSorted = 0
    let firebase = FirebaseManager.shared
    let refrigertorManager = Refrigerator.shared
    var selectIndex = Int()
    
    var ingredientList = [Ingredient]()
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBAction func nameSorted(_ sender: Any) {
        self.ingredientList = ingredientList.sorted(by: {$0.name < $1.name})
        selectSorted = 0
        self.tableView.reloadData()
    }
    @IBAction func typeSorted(_ sender: Any) {
        self.ingredientList = ingredientList.sorted(by: {$0.type < $1.type})
        selectSorted = 1
        self.tableView.reloadData()
    }
    @IBAction func dateSorted(_ sender: Any) {
        self.ingredientList = ingredientList.sorted(by: {$0.expiryDate < $1.expiryDate})
        selectSorted = 2
        self.tableView.reloadData()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        firebase.loadRefrigerator { response in
            self.ingredientList = response.sorted(by: {$0.name < $1.name})
            self.refrigertorManager.setIngredientInfo(response)
            DispatchQueue.main.async {
                self.selectSorted = 0
                self.tableView.reloadData()
            }
        }
    }
    
    func setupTableView(){
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    
    
    // ㅎㅎㅎ
    @IBSegueAction func detailSA(_ coder: NSCoder, sender: Any?, segueIdentifier: String?) -> DetailViewController? {
        return DetailViewController(coder: coder, selectIdx: selectIndex, selectIngredient: ingredientList[selectIndex])
    }
    //    @IBSegueAction func detailSA(_ coder: NSCoder, sender: Any?, segueIdentifier: String?) -> DetailViewController? {
    //        return DetailViewController(coder: coder, selectIdx: selectIndex, selectIngredient: ingredientList[selectIndex])
    //    }
    //
    
    //    @IBSegueAction func DetailSA(_ coder: NSCoder, sender: Any?, segueIdentifier: String?) -> DetailViewController? {
    //        return DetailViewController(coder: coder, selectIdx: selectIndex, ingredientList: [ingredientList[selectIndex]])
    //    }
    //
    //
}



