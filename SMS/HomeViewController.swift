//
//  HomeViewController.swift
//  SMS
//
//  Created by SSd on 1/9/17.
//  Copyright © 2017 SSd. All rights reserved.
//

import UIKit

class HomeViewController: HomePresent {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        addMainView()
    }
    
    func addMainView(){
        headerScrollView.translatesAutoresizingMaskIntoConstraints = false
        indicatorScrollView.translatesAutoresizingMaskIntoConstraints = false
        viewFooter.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(headerScrollView)
        view.addSubview(viewFooter)
        
        headerScrollView.backgroundColor = UIColor.gray
        viewFooter.backgroundColor = UIColor.black
        let views = ["view" : view,"headerScrollView" : headerScrollView,"contentScrollView" : self.collectionViewByCategory.view, "viewFooter" : viewFooter]
        let metrics = ["headerScrollViewHeight" : view.frame.height*7/16,"menuHeight" : 50]
        
        NSLayoutConstraint.activate(NSLayoutConstraint.constraints(withVisualFormat: "V:|[headerScrollView(==headerScrollViewHeight)]", options: [], metrics: metrics, views: views))
        NSLayoutConstraint.activate(NSLayoutConstraint.constraints(withVisualFormat: "H:[headerScrollView(==view)]", options: [], metrics: metrics, views: views))
        NSLayoutConstraint.activate(NSLayoutConstraint.constraints(withVisualFormat: "V:[headerScrollView][contentScrollView][viewFooter(==menuHeight)]|", options: [.alignAllLeft,.alignAllRight], metrics: metrics, views: views))
        viewFooter.setNeedsLayout()
        
    }
    override func viewDidAppear(_ animated: Bool) {
        viewFooter.reDrawLayout(frame: viewFooter.frame)
    }
    
}


