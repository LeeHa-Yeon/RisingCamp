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
    
    //MARK: - Refrigerator 불러오기
    func loadRefrigerator(completion: @escaping ([Ingredient]) -> (Void)) {
        self.db.child("Refrigerator").observeSingleEvent(of: .value) { snapshot in
            if !snapshot.hasChildren() {
                print("don't have Refrigerator")
                return
            }
            
            guard let snapData = snapshot.value as? [String:Any] else {return}
            let jsonData = try! JSONSerialization.data(withJSONObject: Array(snapData.values), options: [])
            
            do {
                let decoder = JSONDecoder()
                let ingredientList = try decoder.decode([Ingredient].self, from: jsonData)
            
                completion(ingredientList)
                
            }catch let error {
                print("refrigerator error --> \(error.localizedDescription)")
            }
            
        }
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
    
    //MARK: - 재료 등록
    func saveShoppingCart(shoppingList: [String]){
        let cartPath = db.child("Cart")
        cartPath.setValue(shoppingList)
    }
    
    func loadShoppingCart(completion: @escaping ([String])->(Void)) {
        self.db.child("Cart").observeSingleEvent(of: .value) { snapshot in
            if !snapshot.hasChildren() {
                print("don't have Cart")
                return
            }
            
            let dic = snapshot.value as! [String]
            completion(dic)
        }
    }
    
    func deleteIngreient(key: String){
        let ref = self.db.child("Refrigerator").child(key)
        ref.removeValue()
    }
    
}
