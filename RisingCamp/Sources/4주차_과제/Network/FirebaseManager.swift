//
//  FirebaseManager.swift
//  RisingCamp
//
//  Created by 이하연 on 2021/11/18.
//

import UIKit
import Firebase

class FirebaseManager {
    static let shared = FirebaseManager()
    
    private init() { }
    
    let db = Database.database().reference()
    
    
    //MARK: - 재료 등록
    func saveIngredient(IngName: String, indredientList: [String:Any]){
        let newIng = db.child("Refrigerator").child(IngName)
        newIng.setValue(indredientList)
    }
    
    
    //MARK: - 재료의 소비기간 불러오기
    
    func loadExpiryDate(IngName: String, completion: @escaping (Int)->(Void)){
        self.db.child("ExpiryDate").observeSingleEvent(of: .value) { snapshot in
            if !snapshot.hasChildren() {
                print("don't have ExpiryDate")
                return
            }
            let dic = snapshot.value as! [String:Int]
            guard let expiryDate = dic[IngName] else {
                print("expiryDate 값을 불러오지 못했습니다.")
                return
            }
            completion(expiryDate)
        }
        
    }

}
