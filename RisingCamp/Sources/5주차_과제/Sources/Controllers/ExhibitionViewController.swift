//
//  ExhibitionViewController.swift
//  RisingCamp
//
//  Created by 이하연 on 2021/11/23.
//

import UIKit
import Kingfisher
import CollectionViewPagingLayout

class ExhibitionViewController: UIViewController {
    
    let apiManager = APIManager.shared
    var documents = [Document]()
    
    let layout = CollectionViewPagingLayout()
    
    
    //MARK: - Components
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    //MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadAPI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        darkMode()
        setCollecionView()
    }
    
    
    //MARK: - Functions
    
    func setCollecionView(){
        
        collectionView.dataSource = self
        collectionView.delegate = self
        
        collectionView.collectionViewLayout = layout
        collectionView.isPagingEnabled = true
        layout.numberOfVisibleItems = nil
        self.layout.invalidateLayoutInBatchUpdate() // collectionView reload 반영하는 method
        
    }
    
    func loadAPI(){
        apiManager.requestImgSearch(parameter: ImgSearchParameter()) { response in
            self.documents = response.documents
            DispatchQueue.main.async {
                self.collectionView.reloadData()
                self.layout.invalidateLayoutInBatchUpdate() // collectionView reload 반영하는 method
            }
        }
    }
    
    func darkMode(){
        let isDarkMode: Bool = UserDefaults.standard.bool(forKey: "darkState")
        if isDarkMode {
            overrideUserInterfaceStyle = .dark
        }else {
            overrideUserInterfaceStyle = .light
        }
    }
    
}

extension ExhibitionViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return documents.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "exhibitionCell", for: indexPath) as? ExhibitionCell else {
            return UICollectionViewCell()
        }
        if let url: URL = URL(string: self.documents[indexPath.row].image_url){
            cell.exhibitionImg.kf.indicatorType = .activity
            cell.exhibitionImg.kf.setImage(with:url)
        }
        return cell
    }
    
}
