//
//  DetailViewController.swift
//  RisingCamp
//
//  Created by 이하연 on 2021/11/19.
//

import UIKit

class DetailViewController: UIViewController {
    
    
    let selectIdx: Int
    let ingredientInfo: Ingredient
    
    let firebase = FirebaseManager.shared
    
    let datePicker = UIDatePicker()
    var typePickerView = UIPickerView()
    var storagePickerView = UIPickerView()
    let typeList = ["채소","육류","유제품","과일"]
    let storageList = ["냉장","냉동","실온"]
    
    var selectDate = Date()
    
    init?(coder: NSCoder, selectIdx: Int, selectIngredient: Ingredient) {
            self.selectIdx = selectIdx
            self.ingredientInfo = selectIngredient
            super.init(coder: coder)
        }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initData()
        setupComponet()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
    }
    
    
    @IBOutlet weak var cntStepper: UIStepper!
    
    @IBOutlet weak var ingredientImg: UIImageView!
    @IBOutlet weak var ingredientName: UILabel!
    @IBOutlet weak var ingredientType: UITextField!
    @IBOutlet weak var ingredientStorage: UITextField!
    @IBOutlet weak var ingredientCnt: UILabel!
    @IBOutlet weak var ingredientShelfLife: UITextField!
    @IBOutlet weak var ingredientExpiryDate: UITextField!
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        ingredientCnt.text = Int(sender.value).description
    }
    
    @IBAction func backBtn(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func saveBtn(_ sender: Any) {
        
        var indredientArr = [String:Any]()
        guard let ingredientName: String = ingredientName.text else {
            print("ingredientName blank")
            return
        }
        indredientArr["name"] = ingredientName
        
        guard let ingredientType: String = ingredientType.text else {
            print("ingredientType blank")
            return
        }
        indredientArr["type"] = ingredientType
        
        guard let ingredientStorage: String = ingredientStorage.text else {
            print("ingredientStorage blank")
            return
        }
        indredientArr["storage"] = ingredientStorage
        
        guard let ingredientCnt: String = ingredientCnt.text else {
            print("ingredientCnt blank")
            return
        }
        indredientArr["cnt"] = Int(ingredientCnt)
        
        guard let ingredientShelf: String = ingredientShelfLife.text else {
            print("ingredientShelfLife blank")
            return
        }
        indredientArr["shelfLife"] = ingredientShelf
        
        guard let ingredientExpiry: String = ingredientExpiryDate.text else {
            print("ingredientExpiryDate blank")
            return
        }
        indredientArr["expiryDate"] = ingredientExpiry
        indredientArr["selected"] = 0
        
        //MARK: - 수정된 재료 정보 업데이트
        self.firebase.saveIngredient(IngName: ingredientName , indredientList: indredientArr)
        self.dismiss(animated: true, completion: nil)
    }
    
    func initData(){
        ingredientImg.image = UIImage(named: ingredientInfo.name)
        ingredientName.text = ingredientInfo.name
        ingredientType.text = ingredientInfo.type
        ingredientStorage.text = ingredientInfo.storage
        ingredientCnt.text = String(ingredientInfo.cnt)
        ingredientShelfLife.text = ingredientInfo.shelfLife
        ingredientExpiryDate.text = ingredientInfo.expiryDate
        
    }
    
    func setupComponet(){
        
        cntStepper.wraps = true
        cntStepper.autorepeat = true
        cntStepper.maximumValue = 100
        
        createDatePicker()
        ingredientShelfLife.textAlignment = .center
        
        typePickerView.delegate = self
        typePickerView.dataSource = self
        
        ingredientType.inputView = typePickerView
        ingredientType.textAlignment = .center
        
        storagePickerView.delegate = self
        storagePickerView.dataSource = self
        
        
        ingredientStorage.inputView = storagePickerView
        ingredientStorage.textAlignment = .center
        
        ingredientExpiryDate.textAlignment = .center
    }
    
    //MARK: - 유통기한 datePicker 표시
    
    func createToolbar() -> UIToolbar {
        
        datePicker.datePickerMode = .date
        
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        
        let doneBtn = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(donePressed))
        toolbar.setItems([doneBtn], animated: true)
        
        ingredientShelfLife.inputAccessoryView = toolbar
        ingredientShelfLife.inputView = datePicker
        
        return toolbar
    }
    
    func createDatePicker() {
        datePicker.preferredDatePickerStyle = .wheels
        datePicker.datePickerMode = .date
        ingredientShelfLife.inputView = datePicker
        ingredientShelfLife.inputAccessoryView = createToolbar()
    }
    
    @objc func donePressed() {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        selectDate = datePicker.date
        self.ingredientShelfLife.text = dateFormatter.string(from: datePicker.date)
        
        guard let ingrentName: String = ingredientName.text else {
            print("ingrentName이 null입니다.")
            return
        }
        
        firebase.loadExpiryDate(IngName: ingrentName) { response in
            var loadTimeInterval: Double
            loadTimeInterval = Double(response*60*60*24)
            let date = Date(timeInterval: loadTimeInterval, since: self.selectDate)
            self.ingredientExpiryDate.text = dateFormatter.string(from: date)
        }
        self.view.endEditing(true)
    }
    
    
    
    
    
}
