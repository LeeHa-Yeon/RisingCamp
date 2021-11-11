//
//  DetailMemoViewController.swift
//  RisingCamp
//
//  Created by 이하연 on 2021/11/11.
//

import UIKit

class DetailMemoViewController: UIViewController {
    
    let memoManager = MemoManager.shared
    
    var selectIdx = Int()
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var contentLabel: UITextView!
    
    @IBAction func backButton(_ sender: UIBarButtonItem) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func saveButton(_ sender: Any) {
        memoManager.memoList[selectIdx].title = titleLabel.text ?? "제목없음"
        memoManager.memoList[selectIdx].date = Date()
        memoManager.memoList[selectIdx].content = contentLabel.text ?? ""
        
        let alert = UIAlertController(title: "알림", message: "메모가 수정되었습니다.", preferredStyle: UIAlertController.Style.alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler : nil )
        alert.addAction(okAction)
        present(alert, animated: true, completion: nil)

    }

    override func viewDidLoad() {
        super.viewDidLoad()
        titleLabel.text = memoManager.memoList[selectIdx].title
        dateLabel.text = formatter.string(from: memoManager.memoList[selectIdx].date)
        contentLabel.text = memoManager.memoList[selectIdx].content
        
    }
    
    fileprivate let formatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        return formatter
    }()
    
}
