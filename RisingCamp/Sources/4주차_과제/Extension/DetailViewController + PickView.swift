//
//  DetailViewController + PickView.swift
//  RisingCamp
//
//  Created by 이하연 on 2021/11/19.
//

import Foundation
import UIKit

extension DetailViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        if pickerView == typePickerView {
            return typeList.count
        }
        else if pickerView == storagePickerView {
            return storageList.count
        }else {
            print("PickerView numberOfRowsInComponent error")
            return 0
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        if pickerView == typePickerView {
            return typeList[row]
        }
        else if pickerView == storagePickerView {
            return storageList[row]
        }else {
            print("PickerView titleForRow error")
            return ""
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        if pickerView == typePickerView {
            ingredientType.text = typeList[row]
            ingredientType.resignFirstResponder()
        }
        else if pickerView == storagePickerView {
            ingredientStorage.text = storageList[row]
            ingredientStorage.resignFirstResponder()
        }else {
            print("pickerView didSelectRow 실패")
        }
        
    }
    
    
}
