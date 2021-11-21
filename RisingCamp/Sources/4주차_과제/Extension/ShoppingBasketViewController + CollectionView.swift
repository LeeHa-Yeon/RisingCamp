//
//  ShoppingBasketViewController + CollectionView.swift
//  RisingCamp
//
//  Created by 이하연 on 2021/11/19.
//

import Foundation
import UIKit

extension ShoppingBasketViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cartList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "basketCell", for: indexPath) as? BasketCell else {
            return UICollectionViewCell()
        }
        let target = cartList[indexPath.row]
        cell.ingredientName.text = target
        cell.ingredientImg.image = UIImage(named: target)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("--->\(indexPath.row)")
        let alert = UIAlertController(title: "삭제하시겠습니까?", message: nil, preferredStyle: .alert)
        let ok = UIAlertAction(title: "OK", style: .default) { (ok) in
            self.cartList.remove(at: indexPath.row)
            self.collectionView.reloadData()
        }
        let cancle = UIAlertAction(title: "Cancle", style: .cancel) { (cancle) in }
        alert.addAction(ok)
        alert.addAction(cancle)
        self.present(alert, animated: true, completion: nil)
        
    }
    
}

extension ShoppingBasketViewController: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let margin: CGFloat = 15
        let width: CGFloat = (self.view.bounds.width-(margin*2))/3
        let height: CGFloat = width
        //        let width = self.view.frame.width / 3
        //        let height = width
        //
        return CGSize(width: width, height: height)
    }
}
