//
//  HomePresent.swift
//  SMS
//
//  Created by SSd on 2/17/17.
//  Copyright © 2017 SSd. All rights reserved.
//

import Foundation
import UIKit

class HomePresent : UIViewController{
    let headerScrollView = UIScrollView()
    let indicatorScrollView = UIScrollView()
    let contentScrollView = UIScrollView()
    let viewFooter = MainFooter()
    var homeService : HomeServiceInterface?
    var homeData = [HomeResponseByCategory]()
    var collectionViewByCategory = UICollectionViewController()
    var messageToView : MessageToView = MessageToView()
    
    override func viewDidLoad() {
        homeService =  HomeApiService()
        viewFooter.setDelegate(delegate: self as! MenuDelegate)
        collectionViewByCategory = CategoryCollectionViewController(collectionViewLayout: UICollectionViewFlowLayout() )
        addCollectionViewController(collectionView: collectionViewByCategory)
    }
    public func getHomeData(result : @escaping (MessageToView) -> Void){
        homeService?.getHomeApi(){
            response in
            if(response.isSucess){
                if let JSON = response.json{
                    let data = JSON as? [String: [[String : Any]]]
                    if let data1 = data{
                        for item in data1 {
                            let homeResponse = HomeResponseByCategory(categoryName: item.key, json: item.value)
                            if let homeResponse = homeResponse {
                                self.homeData.append(homeResponse)
                            }
                        }
                    }else{
                        self.messageToView.isSucess = false
                        self.messageToView.message = MessageEncode.PareJsonError.rawValue
                        result(self.messageToView)
                    }
                }
                result(self.messageToView)
            }else{
                self.messageToView.isSucess = false
                self.messageToView.message = response.errorMessage
                result(self.messageToView)
            }
        }
    }
    fileprivate func addCollectionViewController( collectionView: UICollectionViewController) {
        collectionView.view.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(collectionView.view)
        addChildViewController(collectionView)
        collectionView.didMove(toParentViewController: self)
        
    }
}
extension HomeViewController: MenuDelegate {
    func clickMenu(){
        print("click menu")
    }
    func clickSearch(){
        print("click search")
    }
    func clickProfile(){
        print("click profile")
    }
    func clickMessage(){
        print("click message")
    }
    
}
