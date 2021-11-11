//
//  AddMemoViewController.swift
//  RisingCamp
//
//  Created by 이하연 on 2021/11/11.
//

import UIKit

class AddMemoViewController: UIViewController {
    
    let memoManager = MemoManager.shared
    
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var contentTextView: UITextView!
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var contentView2: UIScrollView!
    
    @IBAction func saveTapButton(_ sender: Any){
        var newMemo = memoManager.createAddMemo()
        if titleTextField.text == "" {
            newMemo.title = "제목없음"
        }else{
            newMemo.title = titleTextField.text ?? "제목없음"
        }
        newMemo.content = contentTextView.text ?? ""
        memoManager.addNewMemo(newMemo)
        self.dismiss(animated: true, completion: nil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayout()
    }
    
    func setupLayout(){
        
//        navigationController?.navigationBar.prefersLargeTitles = false
        contentView2.layer.cornerRadius = 10
    }
    
}
