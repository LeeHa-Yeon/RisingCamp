//
//  Ingredient.swift
//  RisingCamp
//
//  Created by 이하연 on 2021/11/18.
//

import Foundation

struct Ingredient: Codable {
    
    let name: String
    let type: String
    let storage: String
    let cnt: Int
    let shelfLife: String
    let expiryDate: String
    
}

class Refrigerator {
    static let shared = Refrigerator()
    
    private init(){}
    
    var ingredientInfo: [Ingredient]?
    
    func setIngredientInfo(_ info: [Ingredient]){
        self.ingredientInfo = info
    }
    
    func getIngredient() -> [Ingredient]? {
        guard let ingredientInfo = self.ingredientInfo else { return nil }
        
        return ingredientInfo
    }
    

}
