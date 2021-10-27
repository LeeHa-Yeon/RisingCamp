//
//  AlarmViewController.swift
//  RisingCamp
//
//  Created by 이하연 on 2021/10/27.
//

import UIKit

class AlarmViewController: UIViewController {
    
    @IBOutlet weak var View1: UIView!
    @IBOutlet weak var View2: UIView!
    @IBOutlet weak var View3: UIView!
    @IBOutlet weak var image1: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        View1.layer.cornerRadius = 15
        View2.layer.cornerRadius = 15
        View3.layer.cornerRadius = 15
        image1.layer.cornerRadius = 5
        
    }
    
}
