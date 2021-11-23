//
//  ExhibitionViewController.swift
//  RisingCamp
//
//  Created by 이하연 on 2021/11/23.
//

import UIKit
import Kingfisher

class ExhibitionViewController: UIViewController {

    @IBOutlet weak var exhibitImg: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let url = URL(string: "https://w7.pngwing.com/pngs/498/24/png-transparent-polar-bear-icon-polar-bear-s-animals-carnivoran-photography.png")
        exhibitImg.kf.setImage(with:url)

    }
    
    


}
