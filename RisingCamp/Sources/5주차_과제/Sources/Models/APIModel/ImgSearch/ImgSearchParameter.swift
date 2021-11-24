//
//  ImgSearchParameter.swift
//  RisingCamp
//
//  Created by 이하연 on 2021/11/23.
//

import UIKit

struct ImgSearchParameter {
    private var query: String
    private var page: Int
    private var size: Int
    
    
    init() {
        //아기북극곰,6,4
        self.query = "포메라니안"
        self.page = 1
        self.size = 10
    }
    
    mutating func setQuery(query: String){
        self.query = query
    }
    
    var toDict: [String:Any] {
        let dict: [String:Any] = [
            "query": self.query,
            "page": self.page,
            "size": self.size
        ]
        return dict
    }
}
