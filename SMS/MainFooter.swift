//
//  MainFooter.swift
//  SMS
//
//  Created by SSd on 1/10/17.
//  Copyright © 2017 SSd. All rights reserved.
//

import UIKit

protocol MenuDelegate {
    func clickMenu()
    func clickSearch()
    func clickProfile()
    func clickMessage()
}

class MainFooter: UIView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    let menu = UIButton()
    let search = UIButton()
    let profile = UIButton()
    let message = UIButton()
    var mDelegate : MenuDelegate?
    override init(frame: CGRect) {
        super.init(frame: frame);
        search.setImage(UIImage(named: "search_ico"), for: .normal)
        menu.setImage(UIImage(named: "menu_ico"), for: .normal)
        profile.setImage(UIImage(named: "profile_ico"), for: .normal)
        message.setImage(UIImage(named: "message_ico"), for: .normal)
        menu.contentHorizontalAlignment = .fill
        menu.contentVerticalAlignment = .center
        search.contentHorizontalAlignment = .fill
        search.contentVerticalAlignment = .center
        profile.contentHorizontalAlignment = .fill
        profile.contentVerticalAlignment = .center
        message.contentHorizontalAlignment = .fill
        message.contentVerticalAlignment = .center
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func setDelegate(delegate : MenuDelegate){
        self.mDelegate = delegate
        menu.addTarget(self, action: #selector(MainFooter.buttonClicked(_:)), for: .touchUpInside)
        search.addTarget(self, action: #selector(MainFooter.buttonClicked(_:)), for: .touchUpInside)
        profile.addTarget(self, action: #selector(MainFooter.buttonClicked(_:)), for: .touchUpInside)
        message.addTarget(self, action: #selector(MainFooter.buttonClicked(_:)), for: .touchUpInside)
    }
    
    @objc private func buttonClicked(_ sender : AnyObject?) {
        if (sender?.isEqual(menu))!{
            mDelegate?.clickMenu()
        }
        if (sender?.isEqual(search))!{
            mDelegate?.clickSearch()
        }
        if (sender?.isEqual(profile))!{
            mDelegate?.clickProfile()
        }
        if (sender?.isEqual(message))!{
            mDelegate?.clickMessage()
        }
        
    }
    
    public func reDrawLayout(frame: CGRect){
        
        search.translatesAutoresizingMaskIntoConstraints = false
        menu.translatesAutoresizingMaskIntoConstraints = false
        profile.translatesAutoresizingMaskIntoConstraints = false
        message.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(menu)
        addSubview(search)
        addSubview(profile)
        addSubview(message)
        let views = ["menu" : menu,"search" : search,"profile" : profile,"message" : message]
        var metrics = ["menuWidth" : frame.width/10,"viewHeigh" : frame.height,"viewWidth" : frame.width,"paddingParent" : 10]
        let spaceAccess = metrics["menuWidth"]! * 4 + metrics["paddingParent"]! * 2
        let spaceBetweenIcon = (metrics["viewWidth"]! - spaceAccess)/3
        metrics.updateValue(spaceBetweenIcon, forKey: "spaceBetweenIcon")
        //menu.backgroundColor = UIColor.blue
        NSLayoutConstraint.activate(NSLayoutConstraint.constraints(withVisualFormat: "V:|[menu(==viewHeigh)]", options: [], metrics: metrics, views: views))
        NSLayoutConstraint.activate(NSLayoutConstraint.constraints(withVisualFormat: "H:|-paddingParent-[menu(==menuWidth)]", options: [], metrics: metrics, views: views))
        NSLayoutConstraint.activate(NSLayoutConstraint.constraints(withVisualFormat: "V:|[search(==viewHeigh)]", options: [], metrics: metrics, views: views))
        NSLayoutConstraint.activate(NSLayoutConstraint.constraints(withVisualFormat: "H:[menu]-spaceBetweenIcon-[search]", options: [], metrics: metrics, views: views))
        NSLayoutConstraint.activate(NSLayoutConstraint.constraints(withVisualFormat: "V:|[profile(==viewHeigh)]", options: [], metrics: metrics, views: views))
        NSLayoutConstraint.activate(NSLayoutConstraint.constraints(withVisualFormat: "H:[search]-spaceBetweenIcon-[profile]", options: [], metrics: metrics, views: views))
        NSLayoutConstraint.activate(NSLayoutConstraint.constraints(withVisualFormat: "V:|[message(==viewHeigh)]", options: [], metrics: metrics, views: views))
        NSLayoutConstraint.activate(NSLayoutConstraint.constraints(withVisualFormat: "H:[message]-paddingParent-|", options: [], metrics: metrics, views: views))
        
    }
}
