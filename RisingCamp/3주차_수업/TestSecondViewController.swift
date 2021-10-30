//
//  TestSecondViewController.swift
//  RisingCamp
//
//  Created by 이하연 on 2021/10/29.
//

import UIKit

class TestSecondViewController: UIViewController {
    //var foo: String = "1"
    init?(coder: NSCoder, test: String) {
        self.test = test
        super.init()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let test: String
    
    override func viewDidLoad() {
        super.viewDidLoad()
      //  foo = "2"
        
    }

    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
