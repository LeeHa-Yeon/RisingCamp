//
//  TestViewController.swift
//  RisingCamp
//
//  Created by 이하연 on 2021/10/29.
//

import UIKit

class TestViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    let post = "123"
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(testNoti), name: Notification.Name("test"), object: nil)
        
    }
    @IBSegueAction func segueActionToSecondViewController(_ coder: NSCoder, sender: Any?, segueIdentifier: String?) -> TestSecondViewController? {
        
        return TestSecondViewController(coder: coder, test: post)
    }
    
    @objc func testNoti() {
        label.text = "노티피케이션"
    }
    
//    override func viewWillAppear(_ animated: Bool) {
//        super.viewWillAppear(animated)
//        print("first: viewWillAppear")
//    }
//
//    override func viewDidAppear(_ animated: Bool) {
//        super.viewDidAppear(animated)
//        print("first: viewDidAppear")
//    }
//
//    override func viewWillDisappear(_ animated: Bool) {
//        super.viewWillDisappear(animated)
//        print("first: viewWillDisappear")
//    }
//
//    override func viewDidDisappear(_ animated: Bool) {
//        super.viewDidDisappear(animated)
//        print("first: viewDidDisappear")
//    }
//    @IBAction func buttonTapped(_ sender: UIButton) {
//        let secondVC = self.storyboard?.instantiateViewController(withIdentifier: "testSecondViewController") as? TestSecondViewController
//        //self.present(secondVC!, animated: true, completion: nil)
//        self.navigationController?.pushViewController(secondVC!, animated: true)
//
//
//    }

}
