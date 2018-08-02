//
//  ViewController.swift
//  examplebycoding
//
//  Created by jason on 2018/8/1.
//  Copyright © 2018年 jason. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let iconView : UIImageView = {
        let image = UIImageView(image: #imageLiteral(resourceName: "icon"))
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    let textField: UITextView = {
        let txt = UITextView()
        let att = NSMutableAttributedString(string: "This is a new start ", attributes: [NSAttributedStringKey.font : UIFont.boldSystemFont(ofSize: 18)])
        att.append(NSMutableAttributedString(string: "\n\nBBDdhd sdhfsd asdfhsd fashdf KFH HDKFHSD SDHFKHASD ASDHFKA DSFADS", attributes: [NSAttributedStringKey.font : UIFont.boldSystemFont(ofSize: 13), NSAttributedStringKey.foregroundColor : UIColor.gray]))
        txt.attributedText = att
//        txt.text = "This is a new start"
//        txt.font = UIFont.boldSystemFont(ofSize: 18)
        txt.translatesAutoresizingMaskIntoConstraints = false
        txt.textAlignment = .center
        return txt
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(iconView)
        view.addSubview(textField)
        setImageLocation()
       
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
    func setImageLocation(){
        let containerView =  UIView()
        view.addSubview(containerView)
        containerView.translatesAutoresizingMaskIntoConstraints = false
        containerView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        containerView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        containerView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        containerView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.5).isActive = true
        
        containerView.addSubview(iconView)
        
        iconView.centerXAnchor.constraint(equalTo: containerView.centerXAnchor).isActive = true
        iconView.centerYAnchor.constraint(equalTo: containerView.centerYAnchor).isActive = true
        iconView.heightAnchor.constraint(equalTo: containerView.heightAnchor, multiplier: 0.5).isActive = true
        
        textField.topAnchor.constraint(equalTo: containerView.bottomAnchor, constant: 5).isActive = true
        textField.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 10).isActive = true
        textField.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 10).isActive = true 
        textField.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
        print("ttt")
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

