//
//  Memo.swift
//  RisingCamp
//
//  Created by 이하연 on 2021/11/09.
//

import Foundation

struct Memo {
    var title: String
    var content: String
    var date: Date
    
    init(){
        self.title = "제목없음"
        self.content = ""
        self.date = Date()
    }
    
    func getTitle() -> String {
        return self.title
    }
    
    mutating func setTitle(_ title: String){
        self.title = title
    }
    
    func getContent() -> String {
        return self.content
    }
    
    mutating func setContent(_ content: String){
        self.content = content
    }

    
    mutating func setDate(){
        self.date = Date()
    }
    
}

class MemoManager {
    
    static let shared: MemoManager = MemoManager()
    
    private init(){}

    var memoList : [Memo] = []
    
    func createAddMemo() -> Memo {
        return Memo()
    }
    
    func addNewMemo(_ sheetInfo: Memo){
        memoList.append(sheetInfo)
    }

}
