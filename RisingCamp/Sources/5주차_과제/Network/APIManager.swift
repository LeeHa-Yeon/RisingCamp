//
//  APIManager.swift
//  RisingCamp
//
//  Created by 이하연 on 2021/11/23.
//

import UIKit
import Alamofire

class APIManager {
    
    static let shared = APIManager()
    
    private init() { }
    
    //MARK: - KaKao ImageSearch API
    func requestImgSearch(parameter: ImgSearchParameter , completion: @escaping (ImgSearchResponseData) -> (Void)) {
        let REQUEST_URL: String = "https://dapi.kakao.com/v2/search/image"
        let HTTP_HEADERS: HTTPHeaders = ["Authorization":"KakaoAK 143ee0cd0d7cbf933f9730f188fa4498"]
        
        AF.request(REQUEST_URL, method: .get, parameters: parameter.toDict, headers: HTTP_HEADERS).validate().validate(statusCode: 200..<300).responseJSON { response in
            switch response.result {
            case .success :
                do{
                    let jsonData = response.value!
                    let json = try JSONSerialization.data(withJSONObject: jsonData, options: .prettyPrinted)
                    let result = try JSONDecoder().decode(ImgSearchResponseData.self, from: json)
                    completion(result)
                }catch {
                    print("parsing error ---> \(error.localizedDescription)")
                }
            case .failure :
                print("fail ---> \(response.result)")
            }
        }
        
    } // func end
    
    
}
