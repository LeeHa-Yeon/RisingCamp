//
//  ImminentViewController.swift
//  RisingCamp
//
//  Created by 이하연 on 2021/11/18.
//

import UIKit

class ImminentViewController: UIViewController {
    
    let refrigertorManager = Refrigerator.shared
    
    var imminentList = Array<Dictionary<String, String>>()
    
    @IBOutlet weak var imminentTableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        compareDate()
    }
    
    func setupTableView(){
        imminentTableView.dataSource = self
        imminentTableView.delegate = self
        let expiryNibName = UINib(nibName: "ExpiryDateTableViewCell", bundle: nil)
        
        imminentTableView.register(expiryNibName, forCellReuseIdentifier: "expiryDateCell")
    }
    
    // 임박한 날짜 구하기
    func compareDate(){
        var loadIngredient = [Ingredient]()
        var dateString = String()
        var standardExpiryDate = Date()
        
        var imminentIngredient = Dictionary<String, String>()
        loadIngredient = refrigertorManager.getIngredient()!
        
        for i in loadIngredient {
            dateString = i.expiryDate + " 00:00:00"
            standardExpiryDate = changeDateFormatter.date(from: dateString)!
            let dDay = Int(standardExpiryDate-Date())/(24*60*60) + 1
            if 0 <= dDay && dDay <= 7 {
                imminentIngredient["name"] = i.name
                imminentIngredient["dDay"] = String(dDay)
                imminentList.append(imminentIngredient)
            }
        }
        
    }
    
    fileprivate let changeDateFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        dateFormatter.timeZone = NSTimeZone(name: "UTC") as TimeZone?
        return dateFormatter
    }()
    
    fileprivate let changeStrFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        return dateFormatter
    }()
    
    
}

