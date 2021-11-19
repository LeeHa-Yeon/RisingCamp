//
//  ShoppingBasketViewController.swift
//  RisingCamp
//
//  Created by 이하연 on 2021/11/18.
//

import UIKit

class ShoppingBasketViewController: UIViewController {
    
    let firebase = FirebaseManager.shared
    
    var cartList = [String]()
    
    @IBOutlet weak var collectionView: UICollectionView!

    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
        
        firebase.loadShoppingCart { response in
            self.cartList = response
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
        firebase.saveShoppingCart(shoppingList: cartList)
    }
    
    
    func setupCollectionView(){
        collectionView.dataSource = self
        collectionView.delegate = self
    }
    
    @IBAction func addBtn(_ sender: Any) {
        let alert = UIAlertController(title: "장바구니 담기", message: nil, preferredStyle: .alert)
        alert.addTextField { (nameTextField) in
            nameTextField.placeholder = "재료명을 입력해주세요"
        }
        let ok = UIAlertAction(title: "OK", style: .default) { (ok) in
            
            guard let alertTextField:String = alert.textFields?[0].text else {
                return
            }
            self.cartList.append(alertTextField)
            self.collectionView.reloadData()
        }
        let cancel = UIAlertAction(title: "Cancle", style: .cancel) { (cancle) in
        }
        alert.addAction(cancel)
        alert.addAction(ok)
        
        self.present(alert, animated: true, completion: nil)
    }
}
