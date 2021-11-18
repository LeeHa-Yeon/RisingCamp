//
//  ExpiryDateViewController.swift
//  RisingCamp
//
//  Created by 이하연 on 2021/11/17.
//

import UIKit
import EASegments

class ExpiryDateViewController: UIViewController, EASegmentsDelegate {
    
    @IBOutlet weak var segmentsViaIB: EASegments!
    let carmine =  #colorLiteral(red: 0.2004446089, green: 0.2323476076, blue: 0.4184677899, alpha: 1)
    let flamingo = #colorLiteral(red: 0.495657444, green: 0.7202214599, blue: 0.9071255922, alpha: 1)
    
    
    @IBOutlet weak var imminentView: UIView!
    @IBOutlet weak var expiredView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        setupSegment()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        imminentView.alpha = 1
        expiredView.alpha = 0
    }
    
    func setupSegment(){
        segmentsViaIB.titles = ["소비기간 임박", "만료된 재료"]
        
        segmentsViaIB.backgroundColor = flamingo
        segmentsViaIB.selectedBackgroundColor = .white
        
        segmentsViaIB.titleColor = carmine
        segmentsViaIB.selectedTitleColor = carmine
        
        segmentsViaIB.titleFont = UIFont(name: "HelveticaNeue-Light", size: 13.0)
        segmentsViaIB.delegate = self
    }
    
    // addTarget
    @objc
    @IBAction func segmentsValueDidChange(_ sender: EASegments) {
        print("valueChanged: \(sender.selectedIndex) [\(sender.selectedTitle ?? "nil")]")
    }
    
    // EASegmentsDelegate
    func segments(_ segments: EASegments, didSelectAt index: Int) {
        let storyboard = UIStoryboard(name:"Refrigerator",bundle: nil)
        if segments.selectedIndex == 0 {
            imminentView.alpha = 1
            expiredView.alpha = 0
            
            if let ImminentVC = storyboard.instantiateViewController(identifier: "ImminentSB") as? ImminentViewController {
                addChild(ImminentVC)
                imminentView.addSubview(ImminentVC.view)
                ImminentVC.didMove(toParent: self)
            }
        }else{
            imminentView.alpha = 0
            expiredView.alpha = 1
            if let ExpirationVC = storyboard.instantiateViewController(identifier: "ExpirationSB") as? ExpirationViewController {
                addChild(ExpirationVC)
                expiredView.addSubview(ExpirationVC.view)
                ExpirationVC.didMove(toParent: self)
            }
        }
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
