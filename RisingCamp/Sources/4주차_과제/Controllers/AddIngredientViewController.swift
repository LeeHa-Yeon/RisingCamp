//
//  AddIngredientViewController.swift
//  RisingCamp
//
//  Created by 이하연 on 2021/11/18.
//

import UIKit

class AddIngredientViewController: UIViewController {
    
    let firebase = FirebaseManager.shared
    
    let datePicker = UIDatePicker()
    var typePickerView = UIPickerView()
    var storagePickerView = UIPickerView()
    let typeList = ["채소","육류","유제품","과일"]
    let storageList = ["냉장","냉동","실온"]
    
    var selectDate = Date()
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var typeTextField: UITextField!
    @IBOutlet weak var storageTextField: UITextField!
    @IBOutlet weak var cntLb: UILabel!
    @IBOutlet weak var cntStepper: UIStepper!
    @IBOutlet weak var shelfLifeTextField: UITextField!
    
    // stepper를 이용하여 수량을 변화시켜주는 부분
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        cntLb.text = Int(sender.value).description
    }
    
    @IBAction func cancleBtn(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func addBtn(_ sender: Any) {
        var indredientArr = [String:Any]()
        guard let ingredientName: String = nameTextField.text else {
            print("nameTextField blank")
            return
        }
        indredientArr["name"] = ingredientName
        
        guard let ingredientType: String = typeTextField.text else {
            print("typeTextField blank")
            return
        }
        indredientArr["type"] = ingredientType
        
        guard let ingredientStorage: String = storageTextField.text else {
            print("storageTextField blank")
            return
        }
        indredientArr["storage"] = ingredientStorage
        
        guard let ingredientCnt: String = cntLb.text else {
            print("cntLb blank")
            return
        }
        indredientArr["cnt"] = Int(ingredientCnt)
        
        guard let ingredientShelf: String = shelfLifeTextField.text else {
            print("shelfLifeTextField blank")
            return
        }
        indredientArr["shelfLife"] = ingredientShelf
        
        //MARK: - 새 재료를 파이어베이스에 등록
        firebase.loadExpiryDate(IngName: indredientArr["name"] as! String) { response in
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy-MM-dd"
            var loadTimeInterval: Double
            loadTimeInterval = Double(response*60*60*24)
            let date = Date(timeInterval: loadTimeInterval, since: self.selectDate)
            indredientArr["expiryDate"] = dateFormatter.string(from:date)
            self.firebase.saveIngredient(IngName: indredientArr["name"] as! String, indredientList: indredientArr)
            
            self.dismiss(animated: true, completion: nil)
        }
        
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpinit()
    }
    
    // MARK: - 컴포넌트들 초기화하는 부분
    func setUpinit(){
        cntStepper.wraps = true
        cntStepper.autorepeat = true
        cntStepper.maximumValue = 100
        
        nameTextField.textAlignment = .center
        
        createDatePicker()
        shelfLifeTextField.textAlignment = .center
        
        typePickerView.delegate = self
        typePickerView.dataSource = self
        
        typeTextField.inputView = typePickerView
        typeTextField.textAlignment = .center
        
        storagePickerView.delegate = self
        storagePickerView.dataSource = self
        
        
        storageTextField.inputView = storagePickerView
        storageTextField.textAlignment = .center
        
    }
    
    
    //MARK: - 유통기한 datePicker 표시
    
    func createToolbar() -> UIToolbar {
        
        datePicker.datePickerMode = .date
        
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        
        let doneBtn = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(donePressed))
        toolbar.setItems([doneBtn], animated: true)
        
        shelfLifeTextField.inputAccessoryView = toolbar
        shelfLifeTextField.inputView = datePicker
        
        return toolbar
    }
    
    func createDatePicker() {
        datePicker.preferredDatePickerStyle = .wheels
        datePicker.datePickerMode = .date
        shelfLifeTextField.inputView = datePicker
        shelfLifeTextField.inputAccessoryView = createToolbar()
    }
    
    @objc func donePressed() {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        selectDate = datePicker.date
        self.shelfLifeTextField.text = dateFormatter.string(from: datePicker.date)
        self.view.endEditing(true)
    }
}
