//
//  HomeViewController.swift
//  SMS
//
//  Created by SSd on 1/9/17.
//  Copyright © 2017 SSd. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    let headerScrollView = UIScrollView()
    let indicatorScrollView = UIScrollView()
    let contentScrollView = UIScrollView()
    let viewFooter = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        addMainView()
    }
    
    func addMainView(){
        headerScrollView.translatesAutoresizingMaskIntoConstraints = false
        indicatorScrollView.translatesAutoresizingMaskIntoConstraints = false
        contentScrollView.translatesAutoresizingMaskIntoConstraints = false
        viewFooter.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(headerScrollView)
        view.addSubview(contentScrollView)
        
        headerScrollView.backgroundColor = UIColor.gray
        contentScrollView.backgroundColor = UIColor.black
        
        let views = ["view" : view,"headerScrollView" : headerScrollView,"contentScrollView" : contentScrollView, "viewFooter" : viewFooter]
        let metrics = ["headerScrollViewHeight" : view.frame.height*7/16]
        
        NSLayoutConstraint.activate(NSLayoutConstraint.constraints(withVisualFormat: "V:|[headerScrollView(==headerScrollViewHeight)]", options: [], metrics: metrics, views: views))
        NSLayoutConstraint.activate(NSLayoutConstraint.constraints(withVisualFormat: "H:[headerScrollView(==view)]", options: [], metrics: metrics, views: views))
        
        NSLayoutConstraint.activate(NSLayoutConstraint.constraints(withVisualFormat: "V:[headerScrollView][contentScrollView]|", options: [.alignAllLeft,.alignAllRight], metrics: metrics, views: views))
    }
    
}
