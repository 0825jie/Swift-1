//
//  ViewController.swift
//  examplebycoding
//
//  Created by jason on 2018/8/1.
//  Copyright © 2018年 jason. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {

   
    // define parameters of viewController
    let smallImgCellId = "smallImgCellId"
    let bigImgCellId = "bigImgCellId"
    var time = 1
    let imagesArray = ["pic1", "pic2", "pic3", "pic4", "pic5"]
    let iconsArray = ["f1",  "f2",  "f3",  "f4", "f5", "f6"]
    let namesArray = ["bread",  "coffee",  "coke",  "Yummy", "FAV", "666!"]
    var iconsCollec: [String]? {
        return iconsArray
    }
    
    // define items for the ViewController 1/1
    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 16
        layout.scrollDirection = .vertical
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = .clear
        return cv
    }()

    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        setBackgroudView()
        
        setContentView()
    }
    
    // setup the backgroudView
    // need to addSubView first and set anchor
    func setBackgroudView() {
        view.backgroundColor = .white
        let iv = UIImageView(image: #imageLiteral(resourceName: "bg-1"))
        iv.contentMode = .scaleAspectFill
        view.addSubview(iv)
        iv.anchor(top: view.topAnchor, leading: view.leadingAnchor, bottom: view.bottomAnchor, trailing: view.trailingAnchor, padding: .zero, size: .zero)
        
    }
    
    // setup viewcontroller content view
    func setContentView() {
        
        view.addSubview(collectionView)
        collectionView.dataSource = self
        collectionView.delegate = self
        
        collectionView.register(BigImgCell.self, forCellWithReuseIdentifier: bigImgCellId)
        collectionView.register(SmallImgCell.self, forCellWithReuseIdentifier: smallImgCellId)
        
        collectionView.anchor(top: view.topAnchor, leading: view.safeAreaLayoutGuide.leadingAnchor, bottom: view.bottomAnchor, trailing: view.safeAreaLayoutGuide.trailingAnchor, padding: .init(top: 0, left: 0, bottom: 0, right: 0), size: .init(width: 0, height: 0 ) )
    }

    
    // return how many sections collectionView has
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    
    // return  number of items for each sections
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        } else {
            return 17
        }
    }
    
    // return cells in item for every section
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.section == 0 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: bigImgCellId, for: indexPath) as! BigImgCell
            cell.images = imagesArray
            return cell
        }
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: smallImgCellId, for: indexPath) as! SmallImgCell
        if let imgName = iconsCollec?[indexPath.item%6] {
            cell.imageView.image = UIImage(named: imgName)
            cell.infoView.text = namesArray[indexPath.item%6]
        }
        return cell
        
    }
    
    //   define the size for every item
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        if indexPath.section == 0 {
            return CGSize(width: view.frame.width, height: 300)
        }else {
            return CGSize(width: (view.frame.width/3) - 16 , height: 130)
        }
        
    }
    
    //   define the size of the
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        
        if section == 1 {
            return UIEdgeInsets(top: 10, left: 8, bottom: 10, right: 8)
        }
        return UIEdgeInsets(top: 10, left: 8, bottom: 10, right: 0)
    }

}

// define classes in the 1st collectionView

class BigImgCell : UICollectionViewCell, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    
    
    var images: [String]? {
        didSet {
            collectionView.reloadData()
        }
    }
    
    let cellId = "cellId"
    
    // define  view(s)  for BigImgCell view  1/1
    let collectionView : UICollectionView = {
        
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 30
        layout.scrollDirection = .horizontal
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = .clear
        return cv
    }()
    
   
    
    override init(frame: CGRect){
        super.init(frame: frame)
        setup()
    }
    
    // setup BigImgCell content view
    func setup(){
        backgroundColor = .clear
        addSubview(collectionView)
        collectionView.anchor(top: topAnchor, leading: leadingAnchor, bottom: bottomAnchor, trailing: trailingAnchor, padding: .zero, size: .zero)
        
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(MiniCell.self, forCellWithReuseIdentifier: cellId)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! MiniCell
        if let imageName = images?[indexPath.item] {
            cell.imageView.image = UIImage(named: imageName)
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 200, height: frame.height -  20)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 5, bottom: 0, right: 5)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("")
    }
    
    private class MiniCell: UICollectionViewCell{
        
        // define view(s) for Minicell view  1/1
        let imageView : UIImageView = {
            let iv = UIImageView()
            iv.translatesAutoresizingMaskIntoConstraints = false
            iv.contentMode = .scaleAspectFill
            iv.clipsToBounds = true
            iv.layer.cornerRadius = 10
            return iv
        }()
        
        
        override init(frame: CGRect){
            super.init(frame: frame)
            setup()
        }
        
        // setup MiniCell content view
        func setup(){
            addSubview(imageView)
            imageView.anchor(top: topAnchor, leading: leadingAnchor, bottom: bottomAnchor, trailing: trailingAnchor, padding: .zero, size: .zero)
        }
        
        required init?(coder aDecoder: NSCoder) {
            fatalError("miss")
        }
        
    }
}

class SmallImgCell : UICollectionViewCell{
    
    // define view(s) for SmallImgCell view  1/2
    let imageView : UIImageView = {
        let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        iv.layer.cornerRadius = 3
        return iv
    }()
    
    // define view(s) for SmallImgCell view  2/2
    let infoView: UITextView = {
        let txt = UITextView()
        txt.font = UIFont.boldSystemFont(ofSize: 18)
        txt.textAlignment = .center
        txt.layer.cornerRadius = 10
        txt.isScrollEnabled = false
        txt.isEditable = false
        txt.backgroundColor = UIColor(red: 0.9882, green: 0.9882, blue: 0.9882, alpha: 0.2)
        return txt
    }()
    
    
    override init(frame: CGRect){
        super.init(frame: frame)
        setup()
    }
    
    // setup SmallImgCell content view
    func setup(){
        backgroundColor = .clear
        addSubview(infoView)
        addSubview(imageView)
       
        imageView.anchor(top: topAnchor, leading: leadingAnchor, bottom: bottomAnchor, trailing: trailingAnchor, padding: .init(top: 0, left: 0, bottom: 20, right: 0), size: .init(width: 60, height: 60))
        infoView.anchor(top: topAnchor, leading: leadingAnchor, bottom: bottomAnchor, trailing: trailingAnchor, padding: .init(top: 100, left: 0, bottom: 0, right: 0), size: .init(width: 20, height: 20))
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("")
    }
}

extension UIView{
    
    func anchorSize(to view: UIView){
        
        widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        heightAnchor.constraint(equalTo: view.heightAnchor).isActive = true
        
    }
    
    func anchor(top: NSLayoutYAxisAnchor?, leading: NSLayoutXAxisAnchor?, bottom: NSLayoutYAxisAnchor?, trailing: NSLayoutXAxisAnchor?, padding: UIEdgeInsets = .zero, size: CGSize = .zero){
        
        translatesAutoresizingMaskIntoConstraints = false
        if let top = top{
            topAnchor.constraint(equalTo: top, constant: padding.top).isActive = true
        }
        
        if let leading = leading{
            leadingAnchor.constraint(equalTo: leading, constant: padding.left).isActive = true
        }
        
        if let bottom = bottom{
            bottomAnchor.constraint(equalTo: bottom, constant: -padding.bottom).isActive = true
        }
        
        if let trailing = trailing{
            trailingAnchor.constraint(equalTo: trailing, constant: -padding.right).isActive = true
        }
        
        if size.width != 0 {
            widthAnchor.constraint(equalToConstant: size.width).isActive = true
        }
        
        if size.height != 0 {
            heightAnchor.constraint(equalToConstant: size.height).isActive = true
        }
        
    }
}


